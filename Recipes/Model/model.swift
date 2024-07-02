import Foundation

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    var id: String { idMeal }  // Conforming to Identifiable
}
