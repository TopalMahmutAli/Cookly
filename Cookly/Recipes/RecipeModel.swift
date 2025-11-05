//
//  RecipeModel.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

struct ReccipeModel: Codable, Identifiable {
    let id: String
    let title: String
    let image: String
    let time: String
    let difficulty: String
    let category: String
    let ingredients: [String]
    let steps: [String]    
}
