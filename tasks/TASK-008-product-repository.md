# TASK-008: Implement ProductRepository

## Title
Implement ProductRepository in the Data layer

## Goal
Create the concrete repository implementation that uses LocalProductDataSource and maps DTOs to domain models.

## Scope - What to Implement
- Create `MyProduct/Data/Repositories/ProductRepository.swift`
  - Implements `ProductRepositoryProtocol`
  - Depends on `LocalProductDataSource` (via protocol)
  - Fetches DTOs from data source, maps each via `toDomain()`, returns `[Product]`

## Out of Scope
- Do NOT add caching logic
- Do NOT add error transformation beyond what's thrown
- Do NOT modify the protocol or data source

## Files Expected to Change
- `MyProduct/Data/Repositories/ProductRepository.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Repository receives data source via initializer injection
- Mapping is a simple `.map { $0.toDomain() }` on the DTO array
- This is the only class that bridges Data and Domain layers

## Completion Criteria
- Conforms to `ProductRepositoryProtocol`
- Uses data source protocol (not concrete type directly)
- Maps DTOs to domain Product models
- Compiles without errors
