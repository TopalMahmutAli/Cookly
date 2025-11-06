import DesignSystem
import SwiftUI

@main
struct CooklyApp: App {
  private let favoritesStore = FavoritesStore()
  var body: some Scene {
    WindowGroup {

      NavigationStack {

        HomePage() 

      }
      .environment(favoritesStore)

    }
  }
}


