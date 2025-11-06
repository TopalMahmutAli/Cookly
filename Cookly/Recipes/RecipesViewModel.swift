//
//  RecipesViewModel.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

import Foundation

@Observable
class RecipesViewModel {
    private let repository: RecipesRepositoryProtocol
    var recipes: [RecipeModel] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    var selectedCategory: String = "Tous"
    var searchText: String = ""
    
     init(repository: RecipesRepositoryProtocol = PersistentRecipesRepository()) {
        self.repository = repository
    }
    
    func loadingRecipes() async {
        isLoading = true
        errorMessage = nil
        do {
            recipes = try await repository.fetchRecipes()
            print("\(recipes.count) recettes chargées")
        } catch {
            errorMessage = "Erreur: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    var filteredCategories: [RecipeModel] {
        var filtered = recipes
        
        if selectedCategory != "Tous" {
            filtered = filtered.filter { $0.category == selectedCategory }
        }
        if !searchText.isEmpty {
            filtered = filtered.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
        return filtered
    }
    
    func addRecipe(_recipe: RecipeModel) async {
        recipes.append(_recipe)
        try? await repository.saveRecipes(recipes)
    }
    
}
