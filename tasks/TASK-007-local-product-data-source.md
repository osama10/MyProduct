# TASK-007: Create LocalProductDataSource

## Title
Create LocalProductDataSource in the Data layer

## Goal
Create a data source that uses JSONLoader to read products.json and return an array of ProductDTO.

## Scope - What to Implement
- Create `MyProduct/Data/DataSources/LocalProductDataSource.swift`
  - Define a protocol for the data source (to allow mocking in tests)
  - Implement the protocol using JSONLoader to load and decode products.json
  - Return `[ProductDTO]`

## Out of Scope
- Do NOT implement networking
- Do NOT add caching
- Do NOT modify JSONLoader or ProductDTO

## Files Expected to Change
- `MyProduct/Data/DataSources/LocalProductDataSource.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Uses the JSONLoader function from Core layer
- Protocol hides implementation (per architecture guidelines)
- Method should be async throws to match the repository chain

## Completion Criteria
- Data source protocol defined
- Implementation loads products.json via JSONLoader
- Returns `[ProductDTO]`
- Compiles without errors
