# TASK-017: Wire Up ContentView with NavigationStack

## Title
Wire up ContentView as the root NavigationStack

## Goal
Update ContentView to serve as the root of the app, hosting the NavigationStack with ProductListView.

## Scope - What to Implement
- Update `MyProduct/ContentView.swift`
  - Set up `NavigationStack` as the root container
  - Embed `ProductListView` as the root view
  - Wire `navigationDestination(for: Product.self)` to `ProductDetailView`

## Out of Scope
- Do NOT add tab bars or other navigation patterns
- Do NOT add onboarding or splash screens
- Do NOT modify any view implementations

## Files Expected to Change
- `MyProduct/ContentView.swift` (modified)

## Implementation Notes
- Use `NavigationStack` (not NavigationView)
- Navigation destination should create ProductDetailView with the selected Product
- ContentView receives or creates the ViewModel

## Completion Criteria
- NavigationStack is the root container
- ProductListView is embedded as root
- Navigation to ProductDetailView works via navigationDestination
- Compiles without errors
