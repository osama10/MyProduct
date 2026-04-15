# TASK-004: Create Core JSONLoader Utility

## Title
Create JSONLoader utility function in Core layer

## Goal
Create a single generic function that loads and decodes a JSON file from the app bundle.

## Scope - What to Implement
- Create `MyProduct/Core/JSONLoader.swift`
  - A single generic function that takes a filename, loads it from the bundle, and decodes it to a specified Decodable type
  - Should throw meaningful errors if file not found or decoding fails

## Out of Scope
- Do NOT create protocols or abstractions around this
- Do NOT create a class or struct wrapper - just a function
- Do NOT add networking capabilities

## Files Expected to Change
- `MyProduct/Core/JSONLoader.swift` (new)
- `MyProduct.xcodeproj/project.pbxproj`

## Implementation Notes
- Keep it simple: one function, no protocols, no abstractions
- Use `Bundle.main` for loading
- Generic over `Decodable` types
- The Core layer has no dependencies on Domain or Data layers

## Completion Criteria
- Function compiles without errors
- Function is generic over any Decodable type
- Function loads from app bundle and decodes JSON
- No dependencies on other app layers
