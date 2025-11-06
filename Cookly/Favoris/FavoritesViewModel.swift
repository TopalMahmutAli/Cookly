//
//  FavoritesViewModel.swift
//  Cookly
//
//  Created by ARARE Kaoutar on 06/11/2025.
//
import Foundation

@Observable
class FavoritesViewModel {
    private let storageKey = "favorite_recipe_ids"
    private(set) var favoriteIds: Set<Int> = []
    
    init() {
        load()
    }
    
    func isFavorite(_ id: Int) -> Bool {
        favoriteIds.contains(id)
    }
    
    func toggleFavorite(id: Int) {
        if favoriteIds.contains(id) {
            favoriteIds.remove(id)
        } else {
            favoriteIds.insert(id)
        }
        save()
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else { return }
        if let decoded = try? JSONDecoder().decode(Set<Int>.self, from: data) {
            favoriteIds = decoded
        }
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(favoriteIds) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}


