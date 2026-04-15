# TASK-012: Create ProductRowView

## Title
Create ProductRowView for displaying a single product in the list

## Goal
Create a SwiftUI view that displays a product's image, name, and price in a list row.

## Scope - What to Implement
- Create `MyProduct/UI/ProductList/ProductRowView.swift`
  - Displays product image (from asset catalog or SF Symbol placeholder)
  - Displays product name
  - Displays product price (formatted properly)
  - Accepts a `Product` as input

## Out of Scope
- Do NOT add tap handling or navigation
- Do NOT add animations
- Do NOT create the list view

## Files Expected to Change
- `MyProduct/UI/ProductList/ProductRowView.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use `foregroundStyle()` not `foregroundColor()`
- Format price using FormatStyle API (not String(format:))
- Use Dynamic Type (no hard-coded font sizes)
- Keep the view simple and focused

## Completion Criteria
- Displays image, name, and price
- Uses modern SwiftUI APIs per coding guidelines
- Compiles without errors
- Preview available
