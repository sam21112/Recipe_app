import SwiftUI

struct MealDetailView: View {
    @ObservedObject var viewModel: RecipeViewModel
    let mealId: String

    var body: some View {
        VStack {
            if let meal = viewModel.selectedMealDetail {
                ScrollView {
                     
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(meal.strMeal)
                            .font(.title)
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
                             
                             
                            .padding(.horizontal)
                        }
                    }
                    VStack(alignment: .leading) {
                        
                        Text("Instructions:")
                            .font(.headline)
                        Text(formatInstructions(meal.strInstructions))
                                                   

                        
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
        .onDisappear {
                    // Resetting the selected meal detail when view disappears
                    viewModel.selectedMealDetail = nil
                }
    }
}
func formatInstructions(_ instructions: String) -> String {
    let normalizedNewlines = instructions.replacingOccurrences(of: "\n+", with: "\n", options: .regularExpression)

     
    return normalizedNewlines.replacingOccurrences(of: "(?<!\n)\n(?![\n])", with: "\n\n", options: .regularExpression)
}


