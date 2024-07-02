Recipe Display App:-

This iOS app, built using SwiftUI, allows users to browse recipes from the "Desserts" category and view detailed information about each recipe, including ingredients and measurements. The app utilizes TheMealDB API to fetch the data.

Features

Browse Recipes: Users can view a list of dessert recipes.
View Recipe Details: Upon selecting a recipe, users can see detailed information including:
Recipe Name
Cooking Instructions
Ingredients and their measurements
Search Functionality: Users can search for recipes by name directly from the main list, enhancing usability and accessibility.
Interactive Animations: Enhance user experience with smooth animations during navigation and interaction.
Project Structure
The project is structured into several key components:

A)Models

1)Meal.swift: Defines the Meal struct that represents a simple meal summary.

2)MealDetail.swift: Contains the MealDetail and MealInfo structs. MealInfo includes detailed information about a meal, including ingredients and their corresponding measurements.

B)ViewModels

1)RecipeViewModel.swift: Manages the fetching of data from TheMealDB API and holds the state of the meals and selected meal details, including search functionality.

C)Views


1)MealListView.swift: Displays a list of meals to the user. Users can tap on a meal to see more details and use the search bar to filter meals.

2)MealDetailView.swift: Shows detailed information about a selected meal, including ingredients and instructions, with interactive animations for a smoother user experience.

Installation
Clone the repository: 
 
git clone https://your-repository-url
cd your-project-directory
Open the project in Xcode:
 
Open RecipeApp.xcodeproj in Xcode.
Run the project:
 
 
Select an iOS simulator or connect a device and hit the Run button in Xcode to build and run the app.
 
Upon launching the app, users are presented with a list of dessert recipes. Tapping on a recipe will navigate to a detail view where users can read the full cooking instructions and see a list of ingredients along with their measurements.


Enhancements and Additional Features

->Search Recipes: A search bar at the top of the MealListView allows users to type in keywords and filter the recipes accordingly.

->Animations: Subtle animations such as fade-in effects for list items and smooth transitions between views provide a polished and engaging user experience.
