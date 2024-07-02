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
        
         static let idMeal = CustomCodingKeys(stringValue: "idMeal")!
        static let strMeal = CustomCodingKeys(stringValue: "strMeal")!
        static let strInstructions = CustomCodingKeys(stringValue: "strInstructions")!
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)

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

        for i in 1...ingredients.count {
            let ingredientKey = CustomCodingKeys(stringValue: "strIngredient\(i)")!
            let measureKey = CustomCodingKeys(stringValue: "strMeasure\(i)")!
            try container.encode(ingredients[i-1], forKey: ingredientKey)
            try container.encode(measurements[i-1], forKey: measureKey)
        }
    }
}
//The MealDetail and MealInfo structs in Swift are designed to parse and handle detailed recipe data from a JSON source using the Codable protocol. MealDetail encapsulates an array of MealInfo instances, each representing detailed information about a meal, including its unique identifier (idMeal), name (strMeal), and cooking instructions (strInstructions). Both structures utilize dynamic coding keys to adaptively parse and encode data where the number of ingredients and measurements can vary, demonstrating flexibility in handling data that might not have a fixed format.

//MealInfo further enhances this by implementing the Identifiable protocol, facilitating its use in SwiftUI lists where unique identifiers are crucial for efficient data handling. Custom dynamic keys within MealInfo allow the encoding and decoding processes to adapt to data with varying numbers of ingredients and their respective measurements, accommodating recipes that may list up to 20 ingredients. This dynamic approach ensures the app can handle a diverse range of meal data without modification to the underlying data structure, making it highly scalable and adaptable for an app dealing with complex and varied culinary data sets.
