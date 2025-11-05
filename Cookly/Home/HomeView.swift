//
//  HomeView.swift
//  Cookly
//
//  Created by ARARE Kaoutar on 05/11/2025.
//
import SwiftUI
import DesignSystem
struct HomePage: View {
  var body: some View {

    ZStack {

      Color.appBackground.ignoresSafeArea()
      VStack(spacing: 0) {
        Spacer()
        LogoSection()
        Spacer()
        NavigationLink(destination: RecipeListView()) {
          HStack(spacing: 15) {
            Image(systemName: "book.closed.fill")
              .font(.title2)
            Text("Découvrir les recettes")
              .font(.title3)
              .fontWeight(.semibold)

            Spacer()

            Image(systemName: "arrow.right.circle.fill")
              .font(.title2)
          }
          .foregroundColor(.white)
          .padding(.horizontal, 28)
          .padding(.vertical, 20)
          .background(
            LinearGradient(
              colors: [.greenPastelBright, .greenSage],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
          .cornerRadius(18)
          .shadow(color: .greenSage.opacity(0.4), radius: 12, x: 0, y: 6)
        }
        .padding(.horizontal, 35)
        Spacer().frame(height: 100)
      }
    }
    .navigationBarHidden(true)
  }
}
