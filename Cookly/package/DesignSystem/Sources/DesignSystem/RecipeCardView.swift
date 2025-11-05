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
    
    public init(
        title: String,
        image: String,
        time: String,
        difficulty: String
    ) {
        self.title = title
        self.image = image
        self.time = time
        self.difficulty = difficulty
    }
    
    public var body: some View {
        HStack(spacing:12){
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 6){
                Text(title)
                    .font(.headline)
                Text("\(time) . \(difficulty)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius:1)
    }
}
