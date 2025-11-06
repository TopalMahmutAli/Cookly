//
//  RecipeCardView.swift
//  DesignSystem
//
//  Created by TOPAL Mahmut-Ali on 05/11/2025.
//

import SwiftUI

public struct RecipeCardView: View {
    public let title: String
    public let image: String
    public let time : String
    public let difficulty: String
    public let showFavorite: Bool
    public let isFavorite: Bool
    public let onToggleFavorite: (() -> Void)?
    
    public init(
        title: String,
        image: String,
        time: String,
        difficulty: String,
        showFavorite: Bool = false,
        isFavorite: Bool = false,
        onToggleFavorite: (() -> Void)? = nil
    ) {
        self.title = title
        self.image = image
        self.time = time
        self.difficulty = difficulty
        self.showFavorite = showFavorite
        self.isFavorite = isFavorite
        self.onToggleFavorite = onToggleFavorite
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)

                    if showFavorite {
                        Button(action: { onToggleFavorite?() }) {
                            Image(systemName: isFavorite ? "star.fill" : "star")
                                .foregroundColor(isFavorite ? Color.greenSage : Color.greenPastelMedium)
                        }
                        .buttonStyle(.plain)
                    }
                }

                HStack(spacing: 12) {
                    HStack(spacing: 6) {
                        Image(systemName: "clock")
                            .foregroundColor(Color.greenPastelMedium)
                            .font(.subheadline)
                        Text(time)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "chart.bar")
                            .foregroundColor(Color.greenPastelMedium)
                            .font(.subheadline)
                        Text(difficulty)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(16)
        .background(.clear)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.greenSage.opacity(0.12), radius: 10, x: 0, y: 6)
    }
}
