import Foundation
import Combine

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedMealDetail: MealInfo?
    @Published var filteredMeals: [Meal] = []
    @Published var searchText: String = "" {
        didSet {
            filterMeals()
        }
    }

    init() {
        
    }
    func loadMeals() {
            Task {
                await fetchMeals()
            }
        }

    func fetchMeals() async {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(MealList.self, from: data)
            DispatchQueue.main.async {
                self.meals = decodedResponse.meals.sorted { $0.strMeal < $1.strMeal }
                self.filteredMeals = self.meals   
            }
        } catch {
            print("Error fetching meals: \(error)")
        }
    }

    func fetchMealDetail(id: String) async {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(MealDetail.self, from: data)
            DispatchQueue.main.async {
                self.selectedMealDetail = decodedResponse.meals.first
            }
        } catch {
            print("Error fetching meal details: \(error)")
        }
    }

    private func filterMeals() {
        if searchText.isEmpty {
            filteredMeals = meals
        } else {
            filteredMeals = meals.filter { $0.strMeal.lowercased().contains(searchText.lowercased()) }
        }
    }
}
//The RecipeViewModel class in the iOS recipe display app acts as the central hub for managing application data and business logic, facilitating a clear separation of concerns within the app's architecture. This view model utilizes SwiftUI's @Published properties to handle state changes that automatically update the UI, ensuring a reactive user experience. The properties include lists of all meals (meals), filtered meals (filteredMeals), and the currently selected meal's details (selectedMealDetail). Additionally, a searchText property is used to filter meals based on user input.

//The view model handles asynchronous API calls to fetch both the list of meals and individual meal details. These operations are performed using Swift's modern concurrency features, ensuring that UI updates remain smooth and responsive. The fetchMeals() function retrieves a list of "Dessert" category meals, sorts them, and updates the relevant properties to reflect this in the UI. On the other hand, fetchMealDetail() fetches detailed information for a specific meal selected by the user. Both functions manage errors gracefully and ensure that all state updates occur on the main thread to avoid UI inconsistencies.

//Search functionality is integrated directly into the view model; the searchText property is observed, and any changes trigger the filterMeals() function to update the list of displayed meals based on the search criteria. This setup not only enhances the app's functionality by allowing dynamic searches but also adheres to best practices in app development by keeping the UI code clean and focused solely on presentation.
