# TASK-015: Create ProductDetailViewModel

## Title
Create ProductDetailViewModel in the UI layer

## Goal
Create a simple ViewModel that holds the selected product for the detail screen.

## Scope - What to Implement
- Create `MyProduct/UI/ProductDetail/ProductDetailViewModel.swift`
  - `@Observable @MainActor` class
  - Holds the selected `Product`
  - Initialized with a `Product` instance

## Out of Scope
- Do NOT add editing or mutation logic
- Do NOT add network calls
- Do NOT create the detail view

## Files Expected to Change
- `MyProduct/UI/ProductDetail/ProductDetailViewModel.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Very simple ViewModel - just holds the product
- Use `@Observable` (not ObservableObject)
- Mark as `@MainActor`

## Completion Criteria
- Class is `@Observable` and `@MainActor`
- Holds a `Product` property
- Compiles without errors
