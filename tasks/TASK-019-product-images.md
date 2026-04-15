# TASK-019: Add Product Images to Assets

## Title
Add product images to Assets.xcassets

## Goal
Add placeholder images or SF Symbols for all products defined in products.json.

## Scope - What to Implement
- Add images to `MyProduct/Assets.xcassets/` matching the `imageName` values in products.json
- Alternatively, update views to use SF Symbols as placeholders if real images aren't available

## Out of Scope
- Do NOT modify any business logic
- Do NOT change the data models
- Do NOT add image caching or downloading

## Files Expected to Change
- `MyProduct/Assets.xcassets/` (new image sets or updates)
- Possibly view files if switching to SF Symbol references

## Implementation Notes
- Match imageName values from products.json exactly
- SF Symbols are acceptable placeholders for v1
- If using SF Symbols, ensure the imageName values in products.json correspond to valid SF Symbol names

## Completion Criteria
- Every product in products.json has a corresponding image available
- Images display correctly in ProductRowView and ProductDetailView
- No missing image warnings at runtime
