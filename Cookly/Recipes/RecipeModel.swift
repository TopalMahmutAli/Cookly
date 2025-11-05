//
//  RecipeModel.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

struct RecipeModel: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let time: String
    let difficulty: String
    let category: String
    let ingredients: [String]
    let steps: [String]
}
