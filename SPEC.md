# App Spec

## Goal
Build an iOS app that shows a product list and a product details screen.

## Screens

### 1. Product List
Show products grouped by category.

Each product row should show:
- product name
- product image
- product price

Each category should appear as its own section with the category name as the section header.

### 2. Product Details
When a product is selected, open a details screen showing:
- large product image
- product price
- product details/description

## Search
Add a search bar on the product list screen.

Search behavior:
- user can search by product name or category name
- if the typed text matches a product name, product name match takes precedence
- otherwise category matches should be shown

## Non-goals for first version
- no cart
- no favorites
- no login
- no backend write operations

## Assumptions
- data can come from a local mock JSON file for the first version
- architecture should be simple and production-friendly
- use SwiftUI
- use async/await if needed
- keep code testable

## Deliverables
- product list screen
- product details screen
- search on list screen
- category-based sectioning
- basic tests for search/grouping logic
