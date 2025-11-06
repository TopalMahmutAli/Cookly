//
//  AddRecipeView.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 06/11/2025.
//

import SwiftUI
import DesignSystem

struct AddRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @State var viewModel: RecipesViewModel
    
    @State private var title = ""
    @State private var category = "Plat"
    @State private var time = ""
    @State private var difficulty = ""
    @State private var imageName = ""
    @State private var selectedUUImage: UIImage?
    @State private var ingredientsText = ""
    @State private var stepsText = ""
    
    let categories = ["Entrée", "Plat", "Dessert"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Ajouter une recette")
                    .font(.title2)
                    .fontWeight(.bold)
                
                DSTextFieldView(text: $title, placeholder: "Titre de la recette")
                DSTextFieldView(text: $time, placeholder: "Temps de préparation (ex. 20 min)")
                DSTextFieldView(text: $difficulty, placeholder: "Difficulté (Facile, Moyen...)")
                DSTextFieldView(text: $ingredientsText, placeholder: "Ingrédients (séparés par des virgules)")
                DSTextFieldView(text: $stepsText, placeholder: "Étapes de préparation (séparées par des virgules)")
                
                CategoryPicker(selectedCategory: $category, categories: categories)
                
                DSPhotoPickerView(selectedImageName: $imageName, selectedImage: $selectedUUImage)
                
                DSButtonView(title: "Ajouter la recette") {
                    Task{
                        let ingredientsArray = ingredientsText
                            .split(separator: ",")
                            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                        
                        let stepsArray = stepsText
                            .split(separator: ",")
                            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                        
                        let newRecipe = RecipeModel(
                            id: UUID().hashValue,
                            title: title,
                            image: imageName.isEmpty ? "default_recipe" : imageName,
                            time: time,
                            difficulty: difficulty,
                            category: category,
                            ingredients: ingredientsArray,
                            steps: stepsArray
                        )
                        await viewModel.addRecipe(_recipe: newRecipe)
                        dismiss()
                    }
                }
                .padding(.top, 20)
                
            }
            .padding()
        }
    }
    
    
}
