# TASK-006: Create products.json Mock Data

## Title
Create mock products.json data file

## Goal
Create a JSON file with mock product data covering 3-4 categories and 8-10 products.

## Scope - What to Implement
- Create `MyProduct/Data/Resources/products.json`
  - Array of product objects matching ProductDTO structure
  - 8-10 products spread across 3-4 categories
  - Each product has: id, name, imageName, price, description, category

## Out of Scope
- Do NOT create actual image assets (that's TASK-019)
- Do NOT modify any Swift files
- Do NOT create data loading code

## Files Expected to Change
- `MyProduct/Data/Resources/products.json` (new)
- `MyProduct.xcodeproj/project.pbxproj` (resource added to build)

## Implementation Notes
- Use realistic product names, prices, and descriptions
- Categories should be distinct and meaningful (e.g., Electronics, Clothing, Books, Home)
- imageName values should use names that will later map to asset catalog images or SF Symbols
- Ensure valid JSON format
- The file must be added to the app target's bundle resources

## Completion Criteria
- Valid JSON file with 8-10 products across 3-4 categories
- JSON structure matches ProductDTO fields exactly
- File is included in the app bundle
