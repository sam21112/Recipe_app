import SwiftUI

struct MealDetailView: View {
    @ObservedObject var viewModel: RecipeViewModel
    let mealId: String

    var body: some View {
        VStack {
            if let meal = viewModel.selectedMealDetail {
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // Headers
                        HStack {
                            Text("Ingredient")
                                .bold()
                                .frame(minWidth: 150, alignment: .leading)
                            Spacer()
                            Text("Measurement")
                                .bold()
                                .frame(minWidth: 50, alignment: .leading)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))  

                        // Rows
                        ForEach(Array(zip(meal.ingredients.indices, meal.ingredients)), id: \.0) { index, ingredient in
                            HStack {
                                Text(ingredient)
                                    .frame(minWidth: 150, alignment: .leading)
                                Spacer()
                                Text(meal.measurements[index])
                                    .frame(minWidth: 50, alignment: .leading)
                            }
                            .padding(.vertical, 5)
                            .background(Color.white)
                             
                            .padding(.horizontal)
                        }
                    }
                    VStack(alignment: .leading) {
                        
                        Text("Instructions:")
                            .font(.headline)
                        Text(meal.strInstructions)

                        
                    }
                }
            } else {
                Text("Loading...")
                    .onAppear {
                        Task {
                            await viewModel.fetchMealDetail(id: mealId)
                        }
                    }
            }
        }
        .padding()
        .navigationTitle("Meal Details")
    }
}
