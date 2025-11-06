//
//  CategoryPicker.swift
//  DesignSystem
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

import SwiftUI

/**
 Category Picker permet au utilisateur de choisir la categorie qu'elle souhaite visualiser,
 par défaut l'affichage se fait en 'tous'
**/

public struct CategoryPicker: View {
    @Binding var selectedCategory: String
    public let categories: [String]
    
    
    public init(selectedCategory: Binding<String>, categories: [String]) {
        self._selectedCategory = selectedCategory
        self.categories = categories
    }
    
    public var body: some View {
        Picker("Catégorie", selection: $selectedCategory){
            ForEach(categories, id: \.self) {
                category in Text(category).tag(category)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}
