# TASK-016: Create ProductDetailView

## Title
Create ProductDetailView for displaying product details

## Goal
Create the product detail screen showing a large image, price, and description.

## Scope - What to Implement
- Create `MyProduct/UI/ProductDetail/ProductDetailView.swift`
  - Large product image
  - Product price (formatted properly)
  - Product description
  - Uses ProductDetailViewModel

## Out of Scope
- Do NOT add cart or purchase functionality
- Do NOT add sharing features
- Do NOT add navigation to other screens

## Files Expected to Change
- `MyProduct/UI/ProductDetail/ProductDetailView.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use `foregroundStyle()` not `foregroundColor()`
- Format price using FormatStyle API
- Use Dynamic Type (no hard-coded font sizes)
- Use `ScrollView` if content might exceed screen height
- Product name as navigation title

## Completion Criteria
- Displays large image, price, and description
- Uses modern SwiftUI APIs per coding guidelines
- Compiles without errors
- Preview available
