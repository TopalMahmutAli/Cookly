//
//  LogoSection.swift
//  Cookly
//
//  Created by ARARE Kaoutar on 06/11/2025.
//
import SwiftUI

public struct LogoSectionView: View {
    public init(){}
    
    public var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.greenPastelLight, .greenPastelMedium],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 130, height: 130)
                    .shadow(color: .black.opacity(0.08), radius: 15, x: 0, y: 8)
                
                Image(systemName: "fork.knife")
                    .font(.system(size: 55, weight: .light))
                    .foregroundColor(.greenSage)
            }
            Text("Cookly")
                .font(.system(size: 52, weight: .bold, design: .rounded))
                .foregroundColor(.greenSageDark)
            Text("Vos recettes en un clic")
                .font(.title3)
                .foregroundColor(.gray.opacity(0.6))
        }
        .padding(.bottom, 80)
    }
}
