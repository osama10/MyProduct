# TASK-021: Write SearchProductsUseCase Tests

## Title
Write unit tests for SearchProductsUseCase

## Goal
Test all search scenarios to verify the name-priority search logic.

## Scope - What to Implement
- Create `MyProductTests/Domain/SearchProductsUseCaseTests.swift`
  - Test: empty query returns all products
  - Test: query matching a product name returns only name-matched products (category-only matches excluded)
  - Test: query matching only a category returns all products in that category
  - Test: no matches returns empty array
  - Test: case-insensitive and diacritic-insensitive matching works

## Out of Scope
- Do NOT test grouping logic (that's TASK-022)
- Do NOT test the ViewModel
- Do NOT write UI tests

## Files Expected to Change
- `MyProductTests/Domain/SearchProductsUseCaseTests.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use Swift Testing framework (`import Testing`)
- Create test product data inline in the test file
- Test the concrete implementation directly (no mocking needed for pure functions)

## Completion Criteria
- All five test scenarios covered
- All tests pass
- Uses Swift Testing framework
