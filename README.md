Recipe Display App:- Demo link- https://drive.google.com/file/d/1h2osk1XXcH9KHWRwrluxa8KXbSoDnF-D/view?usp=sharing

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
 
git clone url
cd your-project-directory
Open the project in Xcode:
 
Open RecipeApp.xcodeproj in Xcode.
Run the project:
 
 
Select an iOS simulator or connect a device and hit the Run button in Xcode to build and run the app.
 
Upon launching the app, users are presented with a list of dessert recipes. Tapping on a recipe will navigate to a detail view where users can read the full cooking instructions and see a list of ingredients along with their measurements.


Enhancements and Additional Features

->Search Recipes: A search bar at the top of the MealListView allows users to type in keywords and filter the recipes accordingly.

->Animations: Subtle animations such as fade-in effects for list items and smooth transitions between views provide a polished and engaging user experience.


Testing:-

1. Light and Dark Mode Compatibility
   
Visual Consistency: The app has been tested in both light and dark modes to ensure visual consistency across all elements. This includes testing all text elements, backgrounds, and custom UI components to ensure they adapt appropriately to both themes.
User Preferences: Tests were conducted to verify that the app respects the system’s appearance settings, automatically switching between light and dark modes based on user or system preferences.

2. Uniform Spacing in Instructions
   
Paragraph Spacing: Special attention was given to the formatting of cooking instructions within the app. The app has been tested to ensure that there is uniform spacing between paragraphs, improving readability. This includes handling cases where the original data might not have consistent spacing or may have multiple newlines.
Adaptive Text Formatting: The text formatting logic has been tested to dynamically adjust to varying lengths of instructions, ensuring that spacing remains consistent regardless of content length or structure.

3. Functionality and Interaction
   
Search Functionality: The search feature has been extensively tested to ensure it filters recipes accurately and efficiently, even as the user types. This includes performance testing to ensure the app remains responsive during live filtering.
Navigation and Workflow: All navigational components have been tested to ensure that users can smoothly transition from the meal list to detailed views and back, with state management systems in place to reset or maintain states as appropriate for the best user experience.
