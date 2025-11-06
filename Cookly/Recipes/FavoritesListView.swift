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
        ZStack {
            Color.appBackground.ignoresSafeArea()
            Group {
                if viewModel.isLoading {
                    ProgressView("Chargement des recettes…")
                } else if let error = viewModel.errorMessage {
                    Text("Erreur: \(error)")
                        .foregroundColor(.red)
                } else if favoriteRecipes.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "star")
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(.greenSage)
                        Text("Aucun favori")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        Text("Ajoutez des recettes en appuyant sur l’étoile.")
                            .foregroundColor(.secondary)
                    }
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
                    .listStyle(.plain)
                    .listRowBackground(Color.appBackground)
                    .listRowSeparator(.hidden)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
        }
        .navigationTitle("Mes favoris")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Mes favoris")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.greenSageDark)
            }
        }
        .task { await viewModel.loadingRecipes() }
    }
}


