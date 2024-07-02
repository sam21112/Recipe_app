import Foundation

struct MealDetail: Codable {
    let meals: [MealInfo]
}

struct MealInfo: Codable, Identifiable {
    var id: String { idMeal }
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    var ingredients: [String] = []
    var measurements: [String] = []

    // Using CustomCodingKeys for both static and dynamic properties
    private struct CustomCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = nil
        }
        
        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = "\(intValue)"
        }
        
        // Static properties can be directly declared here as static constants
        static let idMeal = CustomCodingKeys(stringValue: "idMeal")!
        static let strMeal = CustomCodingKeys(stringValue: "strMeal")!
        static let strInstructions = CustomCodingKeys(stringValue: "strInstructions")!
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)

        // Extract ingredients and measurements using a loop
        for i in 1...20 {
            let ingredientKey = CustomCodingKeys(stringValue: "strIngredient\(i)")
            let measureKey = CustomCodingKeys(stringValue: "strMeasure\(i)")
            if let ingredientKey = ingredientKey, let measureKey = measureKey,
               let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey),
               let measure = try container.decodeIfPresent(String.self, forKey: measureKey),
               !ingredient.isEmpty {
                ingredients.append(ingredient)
                measurements.append(measure)
            }
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CustomCodingKeys.self)
        try container.encode(idMeal, forKey: .idMeal)
        try container.encode(strMeal, forKey: .strMeal)
        try container.encode(strInstructions, forKey: .strInstructions)

        // Encode ingredients and measurements
        for i in 1...ingredients.count {
            let ingredientKey = CustomCodingKeys(stringValue: "strIngredient\(i)")!
            let measureKey = CustomCodingKeys(stringValue: "strMeasure\(i)")!
            try container.encode(ingredients[i-1], forKey: ingredientKey)
            try container.encode(measurements[i-1], forKey: measureKey)
        }
    }
}
