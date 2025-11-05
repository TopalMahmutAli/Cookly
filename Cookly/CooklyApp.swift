//
//  CooklyApp.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 04/11/2025.
//

import SwiftUI

@main
struct CooklyApp: App {
    var body: some Scene {
        WindowGroup {
            Text("Chargement des données...")
                .task{
                    do{
                        let repo = MockRecipesRepository()
                        let recipes = try await repo.fetchRecipes()
                        print("recette chargées",recipes)
                    } catch{
                        print("erreur de chargement des recettes",error)
                    }
                }
        }
    }
}
