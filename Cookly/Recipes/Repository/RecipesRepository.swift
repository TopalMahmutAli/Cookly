//
//  RecipesRepository.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//
import Foundation

protocol RecipesRepository {
    func fetchRecipes() async throws -> [RecipeModel]
}

struct MockRecipesRepository: RecipesRepository {
    func fetchRecipes() async throws -> [RecipeModel] {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([RecipeModel].self, from: data)
    }
}
