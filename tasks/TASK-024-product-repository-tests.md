# TASK-024: Write ProductRepository Tests

## Title
Write unit tests for ProductRepository

## Goal
Test that ProductRepository correctly fetches from the data source and maps DTOs to domain models.

## Scope - What to Implement
- Create `MyProductTests/Data/ProductRepositoryTests.swift`
  - Create a mock data source that returns predefined DTOs
  - Test: repository returns correctly mapped domain models
  - Test: repository propagates data source errors

## Out of Scope
- Do NOT test the real JSON file loading
- Do NOT test use cases or ViewModel

## Files Expected to Change
- `MyProductTests/Data/ProductRepositoryTests.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use Swift Testing framework (`import Testing`)
- Create a mock implementation of the data source protocol
- Inject the mock into ProductRepository
- Verify the output is correctly mapped

## Completion Criteria
- Mock data source created
- Repository returns correct domain models from mock data
- Error propagation tested
- All tests pass
- Uses Swift Testing framework
