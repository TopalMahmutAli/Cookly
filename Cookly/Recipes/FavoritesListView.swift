//
//  FavoritesListView.swift
//  Cookly
//
//  Created by Assistant on 06/11/2025.
//

import SwiftUI
import DesignSystem

struct FavoritesListView: View {
    @State private var viewModel = RecipesViewModel()
    @Environment(FavoritesStore.self) private var favoritesStore
    
    var favoriteRecipes: [RecipeModel] {
        viewModel.recipes.filter { favoritesStore.isFavorite($0.id) }
    }
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Chargement des recettes…")
            } else if let error = viewModel.errorMessage {
                Text("Erreur: \(error)")
                    .foregroundColor(.red)
            } else if favoriteRecipes.isEmpty {
                ContentUnavailableView("Aucun favori",
                                       systemImage: "star",
                                       description: Text("Ajoutez des recettes en appuyant sur l’étoile."))
            } else {
                List(favoriteRecipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeCardView(
                            title: recipe.title,
                            image: recipe.image,
                            time: recipe.time,
                            difficulty: recipe.difficulty,
                            showFavorite: true,
                            isFavorite: favoritesStore.isFavorite(recipe.id),
                            onToggleFavorite: { favoritesStore.toggleFavorite(id: recipe.id) }
                        )
                    }
                }
            }
        }
        .navigationTitle("Mes favoris")
        .task { await viewModel.loadingRecipes() }
        .background(Color.appBackground.ignoresSafeArea())
    }
}


