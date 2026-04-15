# TASK-022: Write GroupProductsByCategoryUseCase Tests

## Title
Write unit tests for GroupProductsByCategoryUseCase

## Goal
Test the grouping and sorting logic.

## Scope - What to Implement
- Create `MyProductTests/Domain/GroupProductsByCategoryUseCaseTests.swift`
  - Test: groups products by category correctly
  - Test: categories sorted alphabetically
  - Test: empty input produces empty output
  - Test: single category produces one group

## Out of Scope
- Do NOT test search logic
- Do NOT test the ViewModel
- Do NOT write UI tests

## Files Expected to Change
- `MyProductTests/Domain/GroupProductsByCategoryUseCaseTests.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use Swift Testing framework (`import Testing`)
- Create test product data inline
- Test the concrete implementation directly

## Completion Criteria
- All four test scenarios covered
- All tests pass
- Uses Swift Testing framework
