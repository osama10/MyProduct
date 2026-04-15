# TASK-023: Write ProductDTO Mapping Tests

## Title
Write unit tests for ProductDTO toDomain mapping

## Goal
Verify that ProductDTO correctly maps to the domain Product model.

## Scope - What to Implement
- Create `MyProductTests/Data/ProductDTOMappingTests.swift`
  - Test: `toDomain()` produces correct `Product` values for all properties

## Out of Scope
- Do NOT test JSON decoding (that's implicitly covered by repository tests)
- Do NOT test the repository

## Files Expected to Change
- `MyProductTests/Data/ProductDTOMappingTests.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Use Swift Testing framework (`import Testing`)
- Create a ProductDTO instance, call toDomain(), verify all fields match

## Completion Criteria
- Mapping test covers all properties
- Test passes
- Uses Swift Testing framework
