# MyProduct

## Building MyProduct with Spec-Driven Development (AI + Human Review)

MyProduct is a small iOS catalog app built with SwiftUI. Users can browse products, search them with clear matching rules, and open a detail screen for each item.

What makes this project interesting is not only the app itself, but the way it was built: a **spec-driven development workflow** where AI generated implementation artifacts and a human reviewed and approved every stage.

## Why This Project Exists

The goal was to demonstrate a clean, production-style development process for a focused feature set:

- List products grouped by category
- Search products with business-priority matching
- Show product details (image, price, description)
- Keep business logic highly testable

The data source is local JSON by design, so architecture and behavior stay the focus.

## Development Story in Stages

### Stage 1: Product Intent (PM-Level Specification)

We started with `SPEC.md`.

This stage defines the product from a product manager perspective: what the app should do, what is in scope, and what should not be built.

**Output of this stage:**
- A clear product intent document (`SPEC.md`)
- Shared language for product behavior before any coding

### Stage 2: Engineering Product Spec

Next, AI generated `PRODUCT_SPEC.md`, and then it was reviewed.

This translated high-level intent into concrete functional requirements: product list behavior, search rules, detail presentation, and local data constraints.

**Output of this stage:**
- Engineering-ready product requirements (`PRODUCT_SPEC.md`)
- Explicit feature boundaries to prevent scope drift

### Stage 3: Implementation Planning

Then we created `IMPLEMENTATION_PLAN.md`.

This stage broke the product spec into architecture decisions, component boundaries, data flow, and test strategy.

**Output of this stage:**
- Build order and execution roadmap (`IMPLEMENTATION_PLAN.md`)
- Defined layering and dependency direction

### Stage 4: Task Decomposition

The plan was split into executable tasks inside `tasks/` (`TASK-001` to `TASK-025`).

Each task targets one unit of work: folder setup, domain models, repository contracts, use cases, view models, views, app wiring, and tests.

**Output of this stage:**
- Atomic, reviewable implementation units
- Full traceability from spec -> plan -> task

### Stage 5: AI Execution with Human Gatekeeping

Every task was implemented by AI, then reviewed and approved before moving forward.

This gave fast implementation while preserving quality control and requirement alignment.

**Output of this stage:**
- Incremental delivery with verification checkpoints
- Reduced risk of large, unreviewed changes

## Core Features

- Category-based product list sections
- Product row with image, name, and price
- Search behavior with priority:
  - match product names first
  - if no product name matches, match by category
- Product detail screen with large image, price, and description
- Unit tests for core logic and view model behavior

## Architecture

The project follows **Clean Architecture with MVVM**.

Dependency direction:

`Data -> Domain <- UI`

This keeps business rules independent, UI thin, and data concerns isolated.

## Layer Responsibilities

### Domain Layer

Purpose: represent business language and rules.

Contains:
- Models: `Product`, `ProductCategory`
- Contracts: `ProductRepositoryProtocol`
- Use cases: `SearchProductsUseCase`, `GroupProductsByCategoryUseCase`

Why it matters:
- Domain logic stays pure and testable
- No UI or persistence coupling

### Data Layer

Purpose: load and map data into domain types.

Contains:
- DTOs: `ProductDTO`
- Data source: `LocalProductDataSource`
- Repository implementation: `ProductRepository`
- Resource: `products.json`

Why it matters:
- Separates decoding/mapping from business rules
- Enables future source swaps (API, database) with minimal domain/UI change

### UI Layer

Purpose: present data and manage screen-level state.

Contains:
- Views: list, row, section header, detail
- ViewModels: `ProductListViewModel`, `ProductDetailViewModel`
- Composition: `ContentView`, `MyProductApp`

Why it matters:
- Presentation stays focused on user interaction
- ViewModels orchestrate use-case pipelines cleanly

### Core Layer

Purpose: shared infrastructure utilities.

Contains:
- `JSONLoader`
- `DIContainer`

Why it matters:
- Centralizes cross-layer infrastructure without polluting feature code

## Summary

This project demonstrates a practical workflow for building software with AI under strong engineering control:

1. Define product intent (`SPEC.md`)
2. Convert intent into engineering spec (`PRODUCT_SPEC.md`)
3. Plan implementation (`IMPLEMENTATION_PLAN.md`)
4. Decompose into tasks (`tasks/`)
5. Implement each task with AI
6. Review and approve each task before progressing

The result is a small but complete app with traceable decisions, clean layering, and test-backed business logic.
