## Cookly 

Cookly est une application iOS de recettes construite avec SwiftUI, suivant une architecture MVVM stricte et un Design System modulaire embarqué sous forme de package Swift. Le projet démontre l’usage d’API modernes (NavigationStack, @State/@Binding/@Observable) et d’async/await pour le chargement des données.

### Équipe / Auteurs
- ARARE Kaoutar 
- TOPAL Mahmut‑Ali 


### Contexte et objectifs pédagogiques
- **Modularisation**: un package `DesignSystem` réutilisable et intégré au projet principal
- **Pattern MVVM**: séparation stricte View / ViewModel / Model
- **SwiftUI moderne**: `NavigationStack`, `@State`, `@Binding`, `@Observable`
- **Swift Concurrency**: `async/await` pour les traitements asynchrones

### Fonctionnalités clés
- Parcours des recettes avec recherche et filtrage par catégorie
- Détail d’une recette (image, temps, difficulté, ingrédients, étapes)
- Gestion des favoris persistés (UserDefaults)
- Navigation fluide via `NavigationStack` (Accueil → Liste → Détail, + écran Favoris)

### Architecture (MVVM)
- **Model**: `RecipeModel` (Codable, Identifiable) + `FavoritesStoreModel` (état observable, persistance UserDefaults)
- **ViewModel**: `RecipesViewModel` (source de vérité de l’UI: chargement, erreurs, filtrage, search)
- **Views**:
  - `HomePage`: écran d’accueil, accès aux recettes et favoris
  - `RecipesListView`: liste + `SearchBarView` + `CategoryPicker` + cartes
  - `RecipeDetailView`: détail d’une recette
  - `FavoritesListView`: liste des favoris

### Données & Repository (Mock par protocole)
- `RecipesRepository` (protocole)
- `MockRecipesRepository` (implémentation mock): charge `recipes.json` depuis le bundle via `async/await`
- Injection par constructeur par défaut dans `RecipesViewModel` pour pouvoir substituer le repository (mock/test)

### Concurrency
- `RecipesViewModel.loadingRecipes()` est `async` et utilise `try await` pour récupérer les données
- Indicateurs d’état: `isLoading`, `errorMessage`

### Design System (Swift Package)
Package: `Cookly/package/DesignSystem`
- **Couleurs**: `AppColors` (ex: `appBackground`, `greenSage`, `greenSageDark`, `greenPastelBright`…)
- **Composants**:
  - `SearchBarView` (liaison `@Binding`)
  - `CategoryPicker` (segmented control, `@Binding`)
  - `RecipeCardView` (titre, image, temps, difficulté, favori)

Ces composants sont utilisés dans l’app principale pour assurer cohérence visuelle et réutilisabilité.

### Navigation
- `CooklyApp` déclare la scène principale avec `NavigationStack`
- Transitions: `HomePage` → `RecipesListView` → `RecipeDetailView`
- Écran dédié: `FavoritesListView`

### Structure du projet
```
Cookly/
  CooklyApp.swift
  Home/
    HomeView.swift (HomePage)
    LogoSection.swift
  Model/
    RecipeModel.swift
    FavoritesStoreModel.swift (FavoritesStore)
  Recipes/
    RecipesListView.swift
    FavoritesListView.swift
    RecipeDetail/RecipeDetailView.swift
    RecipesViewModel.swift
    Repository/
      RecipesRepository.swift (protocol + Mock)
      recipes.json
  package/DesignSystem/
    Sources/DesignSystem/
      Colors/AppColors.swift
      Component/RecipeCardView.swift, SearchBarView.swift, CategoryPicker.swift
```

### Installation & Lancement
1. Ouvrir `Cookly.xcodeproj` dans Xcode 16+
2. Compiler et lancer sur simulateur iOS 17+ (ou appareil réel)
3. Le package `DesignSystem` est inclus dans le workspace du projet

### Bonnes pratiques respectées
- MVVM clair: UI sans logique métier; ViewModel expose l’état et les actions
- Concurrency moderne (`async/await`), pas de callbacks
- Composants UI paramétrables et composables via `@Binding`
- Théming centralisé (couleurs) et composants réutilisables (Design System)

### Critères du rendu — correspondance
- Projet Xcode principal: ✅
- Package `DesignSystem` intégré et utilisé: ✅
- Pattern MVVM et conventions de nommage: ✅ (RecipeModel, RecipesViewModel, …)
- Composants UI + intégration dans les vues: ✅ (, `SearchBarView`, `CategoryPicker`, `RecipeCardView`)
- `NavigationStack`: ✅ (dans `CooklyApp`)
- Mock via protocole: ✅ (`RecipesRepository` + `MockRecipesRepository`)

### Notation



