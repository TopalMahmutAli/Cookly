import DesignSystem
import SwiftUI

@main
struct CooklyApp: App {
    private let favoritesViewModel = FavoritesViewModel()
    var body: some Scene {
        WindowGroup {
            
            NavigationStack {
                
                HomePage()
                
            }
            .environment(favoritesViewModel)
            
        }
    }
}


