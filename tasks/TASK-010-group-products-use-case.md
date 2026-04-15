# TASK-010: Implement GroupProductsByCategoryUseCase

## Title
Implement GroupProductsByCategoryUseCase in the Domain layer

## Goal
Create a use case that groups a list of products into categories sorted alphabetically.

## Scope - What to Implement
- Create `MyProduct/Domain/UseCases/GroupProductsByCategoryUseCase.swift`
  - Define a protocol for the use case
  - Implement the grouping logic:
    - Takes `[Product]`, returns `[ProductCategory]`
    - Groups products by their category property
    - Sorts categories alphabetically by name
    - Works on whatever products it receives (pre-filtered or not)

## Out of Scope
- Do NOT add search/filter logic (that's TASK-009)
- Do NOT modify domain models
- Do NOT add any UI-related code

## Files Expected to Change
- `MyProduct/Domain/UseCases/GroupProductsByCategoryUseCase.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Pure function: input `[Product]`, output `[ProductCategory]`
- Use Swift's `Dictionary(grouping:by:)` for grouping
- Sort the resulting categories alphabetically by name
- Protocol hides implementation per architecture guidelines

## Completion Criteria
- Protocol defined for the use case
- Groups products by category correctly
- Categories sorted alphabetically
- Empty input produces empty output
- Compiles without errors
- No dependencies on Data or UI layers
