# TASK-009: Implement SearchProductsUseCase

## Title
Implement SearchProductsUseCase in the Domain layer

## Goal
Create a use case that filters products by a search query with name-match priority over category-match.

## Scope - What to Implement
- Create `MyProduct/Domain/UseCases/SearchProductsUseCase.swift`
  - Define a protocol for the use case
  - Implement the search logic:
    - Empty query -> return all products unchanged
    - Check product names using `localizedStandardContains`. If any match, return only those
    - Otherwise, check category names using `localizedStandardContains`. Return products whose category matches
    - No matches -> return empty array

## Out of Scope
- Do NOT add grouping logic (that's TASK-010)
- Do NOT add any UI-related code
- Do NOT modify domain models
- Do NOT add sorting logic

## Files Expected to Change
- `MyProduct/Domain/UseCases/SearchProductsUseCase.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Pure function operating on `[Product]` and a query String
- Must use `localizedStandardContains` for filtering (not `contains`)
- Name match has strict priority: if any product name matches, category matches are ignored
- Protocol hides implementation per architecture guidelines

## Completion Criteria
- Protocol defined for the use case
- Implementation handles all four search scenarios (empty, name match, category match, no match)
- Uses `localizedStandardContains` for text comparison
- Compiles without errors
- No dependencies on Data or UI layers
