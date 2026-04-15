# TASK-002: Define Product and ProductCategory Domain Models

## Title
Define domain models: Product and ProductCategory

## Goal
Create the core domain models that the entire app depends on.

## Scope - What to Implement
- Create `MyProduct/Domain/Models/Product.swift`
  - Struct with properties: id (String), name (String), imageName (String), price (Double), description (String), category (String)
  - Conforms to `Identifiable`, `Hashable`, `Sendable`
- Create `MyProduct/Domain/Models/ProductCategory.swift`
  - Struct with properties: name (String), products ([Product])
  - Conforms to `Identifiable` (id derived from name)
  - Lightweight value type, no behavior

## Out of Scope
- Do NOT add Codable conformance to domain models
- Do NOT create DTOs
- Do NOT add any business logic methods
- Do NOT create any UI code

## Files Expected to Change
- `MyProduct/Domain/Models/Product.swift` (new)
- `MyProduct/Domain/Models/ProductCategory.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- These are pure domain models with no dependencies on other layers
- Keep them minimal - just data and protocol conformances
- ProductCategory is a grouping type, not a standalone entity

## Completion Criteria
- Both files compile without errors
- Product conforms to Identifiable, Hashable, Sendable
- ProductCategory conforms to Identifiable
- No imports beyond Foundation (if needed)
