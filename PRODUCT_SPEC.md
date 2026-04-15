# Product Overview

This project is an iOS app built with SwiftUI that displays a list of products and allows users to view product details.

## Core Features

### Product List
- Display products grouped by category (sectioned list)
- Each product item shows:
  - name
  - image
  - price

### Product Details
- Show selected product with:
  - large image
  - price
  - description/details

### Search
- Search bar on product list screen
- Supports search by:
  - product name (higher priority)
  - category name (lower priority)
- If product name matches exist, ignore category matches

## Data Source
- Use local mock JSON data
- No networking required for now

## Notes
- Focus on clean architecture and testable business logic
- Keep implementation simple (no extra features)
- Only build what is defined above
