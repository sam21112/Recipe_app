//
//  MealListView.swift
//  Recipes
//
//  Created by samarth raipal on 7/1/24.
//
import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search meals...", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                List(viewModel.filteredMeals) { meal in
                    NavigationLink(destination: MealDetailView(viewModel: viewModel, mealId: meal.idMeal)) {
                        Text(meal.strMeal)
                    }
                }
                .navigationTitle("Desserts")
                .onAppear {
                    Task {
                        await viewModel.fetchMeals()
                    }
                }
            }
        }
    }
}
