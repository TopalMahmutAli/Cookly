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
                .frame(width:100, height:100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8){
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                HStack(spacing:6){
                    HStack(spacing: 6){
                        Image(systemName: "clock")
                            .foregroundColor(Color.greenPastelMedium)
                            .font(.subheadline)
                        Text(time)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    HStack(spacing: 6){
                        Image(systemName: "chart.bar")
                            .foregroundColor(Color.greenPastelMedium)
                            .font(.subheadline)
                        Text(difficulty)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                
                }
            }
            .padding(16)
        }
//        .background(Color.white)
        .cornerRadius(16)
//        .overlay(
//            RoundedRectangle(cornerRadius: 16)
//                .stroke(Color.greenPastelMedium, lineWidth: 1.5)
//        )
        .shadow(
            color: Color.greenSage.opacity(0.15),
            radius:8,
            x: 0,
            y: 4
            
        )
    }
}
