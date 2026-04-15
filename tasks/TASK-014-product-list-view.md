# TASK-014: Create ProductListView

## Title
Create ProductListView with sectioned list and search

## Goal
Create the main product list screen with sections grouped by category, search bar, and navigation to detail.

## Scope - What to Implement
- Create `MyProduct/UI/ProductList/ProductListView.swift`
  - `List` with sections (one per ProductCategory)
  - Each section uses `ProductSectionHeaderView` as header
  - Each row uses `ProductRowView`
  - `.searchable` modifier bound to ViewModel's search text
  - `navigationDestination(for: Product.self)` for navigation to detail
  - Triggers product loading on appear

## Out of Scope
- Do NOT implement the detail view (that's TASK-016)
- Do NOT add pull-to-refresh
- Do NOT add sorting or filtering UI beyond search

## Files Expected to Change
- `MyProduct/UI/ProductList/ProductListView.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use `NavigationStack` (not NavigationView)
- Use `navigationDestination(for:)` for type-safe navigation
- Use `.searchable` modifier
- ViewModel is passed in or accessed via environment
- Use `ForEach` with identifiable types

## Completion Criteria
- List displays products grouped by category sections
- Search bar filters products via ViewModel
- Navigation to detail is set up (destination can be placeholder until TASK-016)
- Compiles without errors
