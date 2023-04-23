namespace Database.Entities;

public class FoodSchema {
    public Dictionary<int, string> NutrientNameToId {
        get;
        private set;
    } = new Dictionary<int, string>{
        {208, "kCal"},
        {203, "protien"},
        {204, "fat"},
        {269, "totalSugar"},
        {205, "carb"},
        {291, "fibre"},
        {301, "calcium"},
        {303, "iron"},
        {304, "magnesium"},
        {307, "sodium"},
        {309, "zinc"},
        {324, "vitiminD"},
        {401, "vitaminC"},
        {418, "vitaminB12"},
        {601, "cholesterol"},
        {605, "fattyAcidsTransTotal"},
        {606, "fattyAcidsSaturatedTotal"},
    };
}

public class Food : Dictionary<string, object>{
    private static FoodSchema foodSchema = new FoodSchema();

    public Food(){
        this.id = 0;
        foreach (var nutrient in foodSchema.NutrientNameToId.Values){
            this[nutrient] = 0.0f;
        }
    }
    public int id {
        get => (int)this[nameof(id)]; 
        set {
            this[nameof(id)] = value;
    }}
    public string description {
        get => (string)this[nameof(description)];
        set {
            this[nameof(description)] = value;
        }
    }
}