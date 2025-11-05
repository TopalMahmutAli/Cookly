//
//  RecipeDetailView.swift
//  Cookly
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

import SwiftUI
import DesignSystem

struct RecipeDetailView: View {
    let recipe: RecipeModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 4)
                VStack(alignment: .leading, spacing: 10) {
                    Text(recipe.title)
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Label(recipe.time, systemImage: "clock")
                        Label(recipe.difficulty, systemImage: "flame")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingrédients 🥕")
                        .font(.headline)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal)
                Divider()
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Préparation 👨‍🍳")
                        .font(.headline)
                    ForEach(recipe.steps.indices, id: \.self) { index in
                        Text("\(index + 1). \(recipe.steps[index])")
                            .font(.subheadline)
                            .padding(.bottom, 4)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(recipe.title)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.bottom, 20)
        }
    }
}
