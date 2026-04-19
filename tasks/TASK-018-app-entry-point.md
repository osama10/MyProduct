# TASK-018: Wire Up MyProductApp with Dependency Injection

## Title
Wire up MyProductApp entry point with dependency injection

## Goal
Configure the app entry point to create and inject all dependencies (repository, use cases, ViewModel).

## Scope - What to Implement
- Create `MyProduct/Core/DIContainer.swift`
  - Simple struct holding all dependencies (repository, use cases)
  - Creates concrete instances: LocalProductDataSource, ProductRepository, use cases
- Update `MyProduct/MyProductApp.swift`
  - Create DIContainer and pass it to ContentView
- Update `MyProduct/ContentView.swift`
  - Accept DIContainer, pass it to ProductListView
- Update `MyProduct/UI/ProductList/ProductListView.swift`
  - Own ViewModel via `@State private var`
  - Create ViewModel from DIContainer dependencies in init

## Out of Scope
- Do NOT add a full DI framework (e.g. Swinject)
- Do NOT add app lifecycle handling beyond basic setup

## Files Expected to Change
- `MyProduct/Core/DIContainer.swift` (new)
- `MyProduct/MyProductApp.swift` (modified)
- `MyProduct/ContentView.swift` (modified)
- `MyProduct/UI/ProductList/ProductListView.swift` (modified)

## Implementation Notes
- DIContainer is a simple struct — not a service locator or full DI framework
- Dependencies created in correct order inside DIContainer (data source -> repository -> use cases)
- ViewModel ownership belongs to ProductListView (its actual state owner), not the App
- DIContainer is passed top-down for testability

## Completion Criteria
- DIContainer creates and holds all dependencies
- ProductListView owns its ViewModel via @State
- App launches with ProductListView as the root screen
- Compiles without errors
