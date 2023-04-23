using Database.Entities;
using Microsoft.Data.Sqlite;
using CsvHelper;
using System.Text;

namespace Database;
public class Generator
{
    private IRawDataLocation rawDataLocation;
    public Generator() : this(rawDataLocation: new AutoRawDataLocation()){}
    public Generator(IRawDataLocation rawDataLocation) {
        this.rawDataLocation = rawDataLocation;
    }

    public bool GenerationNecessary(){
        return !File.Exists(Configs.Location);
    }

    public void GenerateIfNecessary(){
        if (this.GenerationNecessary()){
            this.Geneate();
        }
    }
    public void Geneate()
    {
        var foodSchema = new FoodSchema();
        var path = rawDataLocation.Path;
        var dict = new Dictionary<int, Food>();

        using (var reader = new StreamReader(path + "/FOOD NAME.csv"))
        using (var csv = new CsvReader(reader, System.Globalization.CultureInfo.InvariantCulture)){
            csv.Read();
            csv.ReadHeader();
            while (csv.Read()){
                var food = new Food{
                    id = csv.GetField<int>(0),
                    description = csv.GetField<string>(4)!,
                };
                dict.Add(food.id, food);
            }
        }

        var nutrientIdsOfInterest = new HashSet<int>(foodSchema.NutrientNameToId.Keys);

        using (var reader = new StreamReader(path + "/NUTRIENT AMOUNT.csv"))
        using (var csv = new CsvReader(reader, System.Globalization.CultureInfo.InvariantCulture)){
            csv.Read();
            csv.ReadHeader();
            while(csv.Read()){
                int nutrientId = csv.GetField<int>(1);
                if (nutrientIdsOfInterest.Contains(nutrientId)) {
                    dict[csv.GetField<int>(0)][foodSchema.NutrientNameToId[nutrientId]] = csv.GetField<float>(2);
                }
            }
        }

        var builder = new SqliteConnectionStringBuilder();

        builder.DataSource = "./database.db";
        using (var connection = new SqliteConnection(builder.ConnectionString))
        {
            connection.Open();
            using (var transaction = connection.BeginTransaction())
            {
                using (var command = connection.CreateCommand())
                {
                    var commandBuilder = new StringBuilder();
                    commandBuilder.Append("create table food (id integer primary key, description text, ");
                    commandBuilder.Append(string.Join(" real, ", foodSchema.NutrientNameToId.Values.Select(v => v.ToLowerInvariant())));
                    commandBuilder.Append(")");
                    command.CommandText = commandBuilder.ToString();
                    command.ExecuteNonQuery();
                }
                using (var command = connection.CreateCommand())
                {
                    var commandBuilder = new StringBuilder();
                    commandBuilder.Append("insert into food values ($id, $description, ");
                    commandBuilder.Append(string.Join(", ", foodSchema.NutrientNameToId.Values.Select(v => "$" + v.ToLowerInvariant())));
                    commandBuilder.Append(")");

                    command.CommandText = commandBuilder.ToString();

                    var id = command.CreateParameter();
                    id.ParameterName = "$id";
                    command.Parameters.Add(id);

                    var desc = command.CreateParameter();
                    desc.ParameterName = "$description";
                    command.Parameters.Add(desc);

                    var parameters = new Dictionary<string, SqliteParameter>();

                    foreach (var nutrient in foodSchema.NutrientNameToId.Values){
                        var param = command.CreateParameter();
                        param.ParameterName = "$" + nutrient.ToLowerInvariant();
                        command.Parameters.Add(param);
                        parameters.Add(nutrient, param);
                    }

                    foreach (var food in dict.Values){
                        id.Value = food.id;
                        desc.Value = food.description;
                        foreach((var paramName, var param) in parameters){
                            param.Value = food[paramName];
                        }
                        command.ExecuteNonQuery();
                    }
                }
                transaction.Commit();
            }
        }
    }
}
