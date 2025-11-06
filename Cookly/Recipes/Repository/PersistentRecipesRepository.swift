//
//  PersistentRecipesRepository.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 06/11/2025.
//

import Foundation

protocol RecipesRepositoryProtocol {
    func fetchRecipes() async throws -> [RecipeModel]
    func saveRecipes(_ recipes: [RecipeModel]) async throws
}

final class PersistentRecipesRepository: RecipesRepositoryProtocol {
    private let defaults = UserDefaults.standard
    private let key = "saved_recipes"
    
    func fetchRecipes() async throws -> [RecipeModel] {
        let mockRepo = MockRecipesRepository()
        var recipes = try await mockRepo.fetchRecipes()
        
        if let data = defaults.data(forKey: key),
           let saved = try? JSONDecoder().decode([RecipeModel].self, from: data) {
            recipes.append(contentsOf: saved)
        }
        return recipes
    }
    func saveRecipes(_ recipes: [RecipeModel]) async throws {
        let data = try JSONEncoder().encode(recipes)
        defaults.set(data, forKey: key)
    }
}

