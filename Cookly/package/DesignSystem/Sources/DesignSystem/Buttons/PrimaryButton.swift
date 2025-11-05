//
//  PrimaryButton.swift
//  DesignSystem
//
//  Created by ARARE Kaoutar on 05/11/2025.
//

import SwiftUI
public struct PrimaryButton: View {
    let title: String
    let iconLeft: String?
    let iconeRight: String?
    let action: () -> Void
    
    public init(
        title: String,
        iconLeft: String? = nil,
        iconeRight: String? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.iconLeft = iconLeft
        self.iconeRight = iconeRight
        self.action = action
    }
    public var body: some View {
        HStack(spacing:15){
            if let iconLeft = iconLeft {
                Image(systemName: iconLeft)
                    .font(.title2)
            }
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            
            if let iconeRight = iconeRight {
                Image(systemName: iconeRight)
                    .font(.title2)
            }
        }
        .foregroundColor(.white)
        .padding(.vertical,20)
        .padding(.horizontal, 28)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.greenPastelBright, Color.greenSage]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(18)
        .shadow(
            color: Color.greenSage.opacity(0.4),
            radius: 12,
            x:0,
            y:6
        )
    }
}

