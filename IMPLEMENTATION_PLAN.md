# Implementation Plan

## 1. High-Level Architecture

The app follows **Clean Architecture with MVVM**, split into three layers:

| Layer | Responsibility | Depends On |
|-------|---------------|------------|
| **Domain** | Models, repository protocols, business logic (grouping, search) | Nothing |
| **Data** | Repository implementations, JSON loading, DTOs | Domain |
| **UI** | SwiftUI views + ViewModels | Domain |
| **Core** | Infrastructure code (JSON loader utility) | Nothing |

Data flows **one way**: `Data -> Domain <- UI`. The UI and Data layers depend on Domain, but never on each other. ViewModels talk to repositories through protocols defined in Domain.

---

## 2. Data Models

### Domain Models

```
Product
├── id: String
├── name: String
├── imageName: String
├── price: Double
├── description: String
└── category: String
```

`Product` conforms to `Identifiable`, `Hashable`, `Sendable`.

```
ProductCategory
├── name: String
└── products: [Product]
```

`ProductCategory` is a lightweight value type (`Identifiable` via `name`). It exists only to represent a grouped section — no behavior, no extra logic.

### DTO (Data layer)

```
ProductDTO (Codable)
├── id: String
├── name: String
├── imageName: String
├── price: Double
├── description: String
└── category: String
```

The DTO maps to the domain `Product` via a simple mapping function. This keeps Codable concerns out of the domain layer.

---

## 3. Folder / Module Structure

```
MyProduct/
├── Core/
│   └── JSONLoader.swift              // Single function: load & decode JSON from bundle
│
├── Domain/
│   ├── Models/
│   │   ├── Product.swift             // Product model
│   │   └── ProductCategory.swift     // Lightweight grouping struct
│   ├── Repositories/
│   │   └── ProductRepositoryProtocol.swift
│   └── UseCases/
│       ├── GroupProductsByCategoryUseCase.swift
│       └── SearchProductsUseCase.swift
│
├── Data/
│   ├── DTOs/
│   │   └── ProductDTO.swift          // Codable DTO + mapping to Product
│   ├── DataSources/
│   │   └── LocalProductDataSource.swift
│   ├── Repositories/
│   │   └── ProductRepository.swift
│   └── Resources/
│       └── products.json
│
├── UI/
│   ├── ProductList/
│   │   ├── ProductListView.swift
│   │   ├── ProductListViewModel.swift
│   │   ├── ProductRowView.swift
│   │   └── ProductSectionHeaderView.swift
│   └── ProductDetail/
│       ├── ProductDetailView.swift
│       └── ProductDetailViewModel.swift
│
├── Assets.xcassets/
├── ContentView.swift                 // Root NavigationStack
└── MyProductApp.swift                // App entry point
```

---

## 4. Step-by-Step Implementation Plan

### Phase 1 — Foundation

1. **Create folder structure** — set up Core, Domain, Data, UI folders.
2. **Domain models** — define `Product` and `ProductCategory`.
3. **Repository protocol** — define `ProductRepositoryProtocol` with `func fetchProducts() async throws -> [Product]`.
4. **Core JSON loader** — a single generic function that loads a JSON file from the app bundle and decodes it. No protocols, no abstractions — just a function.

### Phase 2 — Data Layer

5. **ProductDTO** — Codable struct with a `toDomain()` method that returns `Product`.
6. **products.json** — mock JSON with ~8-10 products across 3-4 categories.
7. **LocalProductDataSource** — uses JSONLoader to read products.json and return `[ProductDTO]`.
8. **ProductRepository** — implements `ProductRepositoryProtocol`, uses data source, maps DTOs to domain models.

### Phase 3 — Business Logic (Use Cases)

9. **SearchProductsUseCase** — takes `[Product]` and a query string, returns filtered `[Product]`.
   - Empty query → return all products unchanged.
   - Check product names first using `localizedStandardContains`. If any match, return only those.
   - Otherwise, check category names using `localizedStandardContains`. Return products whose category matches.
10. **GroupProductsByCategoryUseCase** — takes `[Product]`, returns `[ProductCategory]` sorted alphabetically by category name. Works on whatever products it receives (already filtered or not).

**Pipeline in the ViewModel**: all products → `SearchProductsUseCase` (filter) → `GroupProductsByCategoryUseCase` (group) → display.

### Phase 4 — UI: Product List

11. **ProductListViewModel** — `@Observable @MainActor` class. Holds all products, search text. Computes displayed categories by piping through search then grouping use cases.
12. **ProductRowView** — displays image, name, price for a single product.
13. **ProductSectionHeaderView** — section header showing category name.
14. **ProductListView** — `List` with sections, `.searchable` modifier, `navigationDestination(for:)`.

### Phase 5 — UI: Product Detail

15. **ProductDetailViewModel** — `@Observable @MainActor` class. Holds the selected `Product`.
16. **ProductDetailView** — large image, price, description.

### Phase 6 — Wiring

17. **ContentView** — set up `NavigationStack` with `ProductListView` as root.
18. **MyProductApp** — create and inject dependencies (repository, use cases, view model).

### Phase 7 — Polish & Assets

19. **Add product images** to Assets.xcassets (or use SF Symbols as placeholders).
20. **Build and verify** — ensure the project compiles and runs.

### Phase 8 — Tests

21. Write unit tests (see Section 6 below).

---

## 5. Where Business Logic Lives

| Logic | Location | Why |
|-------|----------|-----|
| **Search with priority rule** | `SearchProductsUseCase` (Domain) | Pure function, encapsulates the "name > category" priority rule. Returns filtered `[Product]`. |
| **Grouping by category** | `GroupProductsByCategoryUseCase` (Domain) | Pure function, takes any `[Product]` and groups into `[ProductCategory]`. Runs after search. |
| **Fetching products** | `ProductRepository` (Data) behind `ProductRepositoryProtocol` (Domain) | Abstracts data source; can swap JSON for network later. |
| **Coordinating state** | `ProductListViewModel` (UI) | Thin coordinator: pipes products through search → grouping, holds UI state. |

The two use cases are independent and composable. The ViewModel chains them: **search first, then group**. This means grouping always operates on the already-filtered list, so sections only appear if they contain matching products.

---

## 6. Testing Strategy

### Unit Tests (primary focus)

| What to Test | Test Cases |
|-------------|------------|
| **SearchProductsUseCase** | Empty query → returns all products. Query matching a product name → returns only name-matched products (category-only matches excluded). Query matching only a category → returns all products in that category. No matches → returns empty. Case-insensitive and diacritic-insensitive matching works. |
| **GroupProductsByCategoryUseCase** | Groups products by category correctly. Categories sorted alphabetically. Empty input → empty output. Single category → one group. |
| **ProductDTO mapping** | `toDomain()` produces correct `Product` values. |
| **ProductRepository** | Inject a mock data source. Assert it returns correctly mapped domain models. |
| **ProductListViewModel** | Inject mock repository and use cases. Assert initial load populates products. Assert search text changes trigger search → grouping pipeline and produce correct grouped results. |

### What We Skip

- **UI tests** — not needed; views are simple and logic lives in ViewModels/use cases.
- **Snapshot tests** — out of scope for v1.

### Test Structure

```
MyProductTests/
├── Domain/
│   ├── SearchProductsUseCaseTests.swift
│   └── GroupProductsByCategoryUseCaseTests.swift
├── Data/
│   ├── ProductDTOMappingTests.swift
│   └── ProductRepositoryTests.swift
└── UI/
    └── ProductListViewModelTests.swift
```

All tests use the Swift Testing framework (`import Testing`).
