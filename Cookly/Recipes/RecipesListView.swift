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
    @Environment(FavoritesStore.self) private var favoritesStore
    
    let categories = ["Tous", "Entrée", "Plat", "Dessert"]
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            VStack(spacing: 12) {
                SearchBarView(text: $viewModel.searchText, placeholder: "Rechercher votre recettes...")
                CategoryPicker(selectedCategory: $viewModel.selectedCategory, categories: categories)
                
                if viewModel.isLoading {
                    ProgressView("Chargement des recettes...")
                } else if let error = viewModel.errorMessage{
                    Text("Erreur:\(error)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.filteredCategories) { recipe in
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
                    .task { await viewModel.loadingRecipes() }
                }
            }
        }
        .navigationTitle("Recettes")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Recettes")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.greenSageDark)
            }
        }
    }
}
