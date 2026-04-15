# TASK-003: Define ProductRepositoryProtocol

## Title
Define ProductRepositoryProtocol in the Domain layer

## Goal
Create the repository protocol that defines the contract for fetching products, keeping the domain layer independent of data sources.

## Scope - What to Implement
- Create `MyProduct/Domain/Repositories/ProductRepositoryProtocol.swift`
  - Protocol with method: `func fetchProducts() async throws -> [Product]`

## Out of Scope
- Do NOT implement the protocol (that's TASK-008)
- Do NOT add any other methods beyond fetchProducts
- Do NOT create mock implementations

## Files Expected to Change
- `MyProduct/Domain/Repositories/ProductRepositoryProtocol.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- The protocol must use async/await (not closures)
- It should only depend on the domain `Product` model
- This protocol will be implemented by `ProductRepository` in the Data layer

## Completion Criteria
- Protocol file compiles without errors
- Protocol defines `fetchProducts() async throws -> [Product]`
- No dependencies on Data or UI layers
