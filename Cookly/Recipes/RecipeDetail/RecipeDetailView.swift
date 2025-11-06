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
    @Environment(FavoritesStore.self) private var favoritesStore
    
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
                    HStack(alignment: .firstTextBaseline, spacing: 8){
                        Text(recipe.title)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.greenSageDark)
                        Button(action: { favoritesStore.toggleFavorite(id: recipe.id) }){
                            Image(systemName: favoritesStore.isFavorite(recipe.id) ? "star.fill" : "star")
                                .foregroundColor(favoritesStore.isFavorite(recipe.id) ? .greenSage : .greenPastelBright)
                                .font(.title3)
                        }
                        .buttonStyle(.plain)
                    }
                    HStack(spacing:15) {
                        Label(recipe.time, systemImage: "clock")
                            .font(.subheadline)
                            .foregroundColor(.greenPastelBright)
                        Label(recipe.difficulty, systemImage: "flame")
                            .font(.subheadline)
                            .foregroundColor(.greenPastelBright)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.greenSageDark.opacity(0.1))
                    .cornerRadius(10)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingrédients 🥕")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.greenSageDark)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                            .font(.subheadline)
                            .padding(.leading)
                    }
                }
                .padding(.horizontal)
                Divider()
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Préparation 👨‍🍳")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.greenSageDark)
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
        .background(Color.appBackground.ignoresSafeArea())
    }
}
