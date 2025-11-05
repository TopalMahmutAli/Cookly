//
//  RecipesViewModel.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

import Foundation

@Observable
class RecipesViewModel {
    private let repository: RecipesRepository
    var recipes: [RecipeModel] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    var selectedCategory: String = "Tous"
    
     init(repository: RecipesRepository = MockRecipesRepository()) {
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
    var filteredRecipes: [RecipeModel] {
        if selectedCategory == "Tous"{
            return recipes
        }else {
            return recipes.filter { $0.category == selectedCategory }
        }
            
    }
    
}
