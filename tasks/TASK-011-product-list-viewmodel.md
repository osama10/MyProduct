# TASK-011: Create ProductListViewModel

## Title
Create ProductListViewModel in the UI layer

## Goal
Create the ViewModel that coordinates fetching products and piping them through search and grouping use cases.

## Scope - What to Implement
- Create `MyProduct/UI/ProductList/ProductListViewModel.swift`
  - `@Observable @MainActor` class
  - Holds all products (fetched from repository)
  - Holds search text (bound to the search bar)
  - Computes displayed categories by piping through: search use case -> grouping use case
  - Provides a method to load products from the repository
  - Handles loading and error states

## Out of Scope
- Do NOT create any views
- Do NOT implement navigation logic
- Do NOT add persistence or caching

## Files Expected to Change
- `MyProduct/UI/ProductList/ProductListViewModel.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Depends on `ProductRepositoryProtocol`, `SearchProductsUseCase` protocol, and `GroupProductsByCategoryUseCase` protocol (all via injection)
- Pipeline: all products -> SearchProductsUseCase(query) -> GroupProductsByCategoryUseCase -> [ProductCategory] for display
- Use `@Observable` (not ObservableObject)
- Mark as `@MainActor`

## Completion Criteria
- Class is `@Observable` and `@MainActor`
- Dependencies injected via initializer (protocols, not concrete types)
- Search + grouping pipeline works correctly
- Compiles without errors
