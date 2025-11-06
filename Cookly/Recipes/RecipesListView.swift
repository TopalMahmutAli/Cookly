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
    @State private var isShowingAddRecipe: Bool = false
    
    let categories = ["Tous", "Entrée", "Plat", "Dessert"]
    
    var body: some View {
        VStack(spacing: 16){
            SearchBarView(
                text: $viewModel.searchText,
                placeholder: "Rechercher votre recettes..."
            )
            .padding(.horizontal)
            
            CategoryPicker(
                selectedCategory: $viewModel.selectedCategory,
                categories: categories
            )
            .padding(.horizontal)
            
            if viewModel.isLoading {
                ProgressView("Chargement des recettes...")
                    .padding(.top, 50)
            } else if let error = viewModel.errorMessage{
                Text("Erreur:\(error)")
                    .foregroundColor(.red)
                    .padding(.top, 50)
            }else {
                List(viewModel.filteredCategories){recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                        RecipeCardView(
                            title: recipe.title,
                            image: recipe.image,
                            time: recipe.time,
                            difficulty: recipe.difficulty
                        )
                    }
                    
                }
                .listStyle(.plain)
            }
        }
        .task {
            await viewModel.loadingRecipes()
        }
        .overlay(alignment: .bottomTrailing){
            Button{
                isShowingAddRecipe = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 56))
                    .foregroundColor(.greenSage)
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .sheet(isPresented: $isShowingAddRecipe){
            AddRecipeView(viewModel: viewModel)
        }
    }
}
