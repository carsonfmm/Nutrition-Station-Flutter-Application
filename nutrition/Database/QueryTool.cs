namespace Database;
using Database.Entities;
using Microsoft.Data.Sqlite;
using System.Linq;
using System.Data;

public class QueryTool {

    private FoodSchema foodSchema = new FoodSchema();

    public QueryTool() {
        new Generator().GenerateIfNecessary();
    }
    public Food FoodById(int id) {
        var builder = new SqliteConnectionStringBuilder();
        builder.DataSource = "./database.db";
        using (var connection = new SqliteConnection(builder.ConnectionString))
        {
            connection.Open();
            using (var command = connection.CreateCommand())
            {
                command.CommandText = @"
                    select * from food where food.id = $id limit 1
                ";
                command.Parameters.AddWithValue("$id", id);
                using (var reader = command.ExecuteReader()){
                    return DataRecordToFood(reader.Cast<IDataRecord>().First());
                }
            }
        }
    }

    public IEnumerable<Food> SearchForFood(string searchTerm) {
        var builder = new SqliteConnectionStringBuilder();
        builder.DataSource = "./database.db";
        using (var connection = new SqliteConnection(builder.ConnectionString))
        {
            connection.Open();
            using (var command = connection.CreateCommand())
            {
                command.CommandText = @"
                    select * from food where instr(food.description, $substr)
                ";
                command.Parameters.AddWithValue("$substr", searchTerm);
                using (var reader = command.ExecuteReader())
                foreach (var record in reader.Cast<IDataRecord>()) {
                    yield return DataRecordToFood(record);
                }
            }
        }
    }
    public Food DataRecordToFood(IDataRecord reader) {
        var food = new Food {
            id = (int) reader.GetInt64(0),
            description = reader.GetString(1) // use GetDouble for floats, idk why
        };
        int i = 2;
        foreach (var nutrient in foodSchema.NutrientNameToId.Values){
            food[nutrient] = (float)reader.GetDouble(i);
            i++;
        }
        return food;
    }
}
