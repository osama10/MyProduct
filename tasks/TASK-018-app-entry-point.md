# TASK-018: Wire Up MyProductApp with Dependency Injection

## Title
Wire up MyProductApp entry point with dependency injection

## Goal
Configure the app entry point to create and inject all dependencies (repository, use cases, ViewModel).

## Scope - What to Implement
- Update `MyProduct/MyProductApp.swift`
  - Create concrete instances: LocalProductDataSource, ProductRepository, use cases
  - Create ProductListViewModel with injected dependencies
  - Pass ViewModel to ContentView

## Out of Scope
- Do NOT add a DI container or framework
- Do NOT add app lifecycle handling beyond basic setup
- Do NOT modify any other files

## Files Expected to Change
- `MyProduct/MyProductApp.swift` (modified)

## Implementation Notes
- Simple manual dependency injection at the composition root
- Create dependencies in the correct order (data source -> repository -> use cases -> ViewModel)
- Use `@State` for the ViewModel if needed to maintain ownership

## Completion Criteria
- All dependencies created and wired correctly
- ViewModel receives repository and use cases via injection
- App launches with ProductListView as the root screen
- Compiles without errors
