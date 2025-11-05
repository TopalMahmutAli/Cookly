//
//  RecipesList.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

import SwiftUI

struct RecipesListView: View {
    @State var viewModel = RecipesViewModel()
    
    var body: some View {
        NavigationStack{
            if viewModel.isLoading {
                ProgressView("Chargement des recettes...")
            } else if let error = viewModel.errorMessage{
                Text("Erreur:\(error)")
                    .foregroundColor(.red)
            }else {
                List(viewModel.recipes){recipe in NavigationLink(destination: Text(recipe.title)){
                    RecipeRowView(recipe: recipe)
                }
                    
                }
                .task {
                    await viewModel.loadingRecipes()
                }
            }
        }
    }
}
