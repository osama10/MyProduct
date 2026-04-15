# TASK-005: Create ProductDTO with toDomain Mapping

## Title
Create ProductDTO Codable struct in the Data layer

## Goal
Create a Codable DTO that mirrors the domain Product and provides a mapping function to convert to the domain model.

## Scope - What to Implement
- Create `MyProduct/Data/DTOs/ProductDTO.swift`
  - Codable struct with properties: id (String), name (String), imageName (String), price (Double), description (String), category (String)
  - `toDomain()` method that returns a domain `Product`

## Out of Scope
- Do NOT add any validation logic
- Do NOT create the JSON file (that's TASK-006)
- Do NOT modify domain models

## Files Expected to Change
- `MyProduct/Data/DTOs/ProductDTO.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- The DTO keeps Codable concerns out of the domain layer
- The mapping is a straightforward 1:1 property copy
- Conforms to Codable (and Sendable if needed)

## Completion Criteria
- ProductDTO compiles without errors
- Conforms to Codable
- `toDomain()` returns a valid `Product` instance
- Depends only on Foundation and the Domain Product model
