//
//  Meal.swift
//  Recipes
//
//  Created by samarth raipal on 7/1/24.
//

import Foundation
import Foundation

struct MealList: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable, Equatable {
    let idMeal: String
    let strMeal: String
    var id: String { idMeal }  // Conforming to Identifiable
}
