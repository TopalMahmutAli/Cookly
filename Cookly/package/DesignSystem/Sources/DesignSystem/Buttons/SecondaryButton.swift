//
//  SecondaryButton.swift
//  DesignSystem
//
//  Created by ARARE Kaoutar on 05/11/2025.
//

import SwiftUI

public struct SecondaryButton: View {
    let title: String
    let icon: String?
    let action: () -> Void
    
    public init(
        title: String,
        icon: String? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.action = action
    }
    
    public var body: some View {
        Button(action: action){
            HStack(spacing:12){
                if let icone = icon{
                    Image(systemName: icone)
                        .font(.title3)
                }
                Text(title)
                    .font(.title3)
                    .fontWeight(.medium)
            }
            .foregroundColor(Color.greenSage)
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.greenSage, lineWidth: 2)
                    .cornerRadius(15)
                    .shadow(
                        color: Color.greenSage.opacity(0.2),
                        radius: 6,
                        x: 0,
                        y: 3
                    )
            )
        }
    }
}
#Preview {

    VStack(spacing: 20) {

        SecondaryButton(

            title: "Mes Favoris",

            icon: "heart.fill",

            action: { print("Cliqué !") }

        )

        .padding(.horizontal, 35)

        

        SecondaryButton(

            title: "Annuler",

            action: { print("Cliqué !") }

        )

        .padding(.horizontal, 35)

    }

    .padding()

    .background(Color.appBackground)

}
