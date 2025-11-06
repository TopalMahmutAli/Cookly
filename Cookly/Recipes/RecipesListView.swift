//
//  RecipesList.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

import SwiftUI
import DesignSystem

struct RecipesListView: View {
    @State var viewModel = RecipesViewModel()
    
    let categories = ["Tous", "Entrée", "Plat", "Dessert"]
    
    var body: some View {
        SearchBarView(text: $viewModel.searchText, placeholder: "Rechercher votre recettes...")
        
        CategoryPicker(selectedCategory: $viewModel.selectedCategory, categories: categories)
        
            if viewModel.isLoading {
                ProgressView("Chargement des recettes...")
            } else if let error = viewModel.errorMessage{
                Text("Erreur:\(error)")
                    .foregroundColor(.red)
            }else {
                List(viewModel.filteredCategories){recipe in NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                    RecipeCardView(title: recipe.title, image: recipe.image, time: recipe.time, difficulty: recipe.difficulty)
                }
                    
                }
                .task {
                    await viewModel.loadingRecipes()
                }
            }
        
    }
}
