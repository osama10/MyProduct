# TASK-025: Write ProductListViewModel Tests

## Title
Write unit tests for ProductListViewModel

## Goal
Test the ViewModel's load and search-to-grouping pipeline.

## Scope - What to Implement
- Create `MyProductTests/UI/ProductListViewModelTests.swift`
  - Create mock repository and mock use cases
  - Test: initial load populates products
  - Test: search text changes trigger search -> grouping pipeline
  - Test: correct grouped results produced for various search inputs

## Out of Scope
- Do NOT test UI rendering
- Do NOT write UI tests
- Do NOT test real data loading

## Files Expected to Change
- `MyProductTests/UI/ProductListViewModelTests.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use Swift Testing framework (`import Testing`)
- Create mock implementations of repository and use case protocols
- Inject mocks into the ViewModel
- Test on `@MainActor` since the ViewModel is `@MainActor`

## Completion Criteria
- Mock repository and use cases created
- Initial load test passes
- Search pipeline test passes
- All tests pass
- Uses Swift Testing framework
