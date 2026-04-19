# Master Task List

## Workflow Rules

1. Claude **must read this file** (`tasks/MASTER.md`) to determine the next task.
2. Claude may **only execute the next pending task** after explicit user approval.
3. **Only one task** should be implemented at a time.
4. A task can **only be marked done after user approval**.

### Git Branching

5. If a local git repo does not exist, **create one first** before any task work.
6. Before starting a task, **create a feature branch** named after the task file (e.g., `TASK-001-create-folder-structure`).
7. All task work must be done on the feature branch.

### Task Completion

8. After completing a task, Claude **must wait for user review**.
9. Once the user approves the task:
   - Merge the feature branch into `main`
   - Delete the feature branch
   - Mark the task as **done** in this file
   - Move to the next task

Rules:
- Do not work on any other task
- Do not anticipate future tasks
- Stay strictly within the scope of the selected task
- Respect out-of-scope items in the task file
- After implementation, do not mark the task as done yet

Return:
1. which task you executed
2. files created/changed
3. what was implemented
4. anything that needs my review before approval

---

## Task List

| Task ID  | Description                                      | Status  | Dependencies                | Task File |
|----------|--------------------------------------------------|---------|-----------------------------|-----------|
| TASK-001 | Create folder structure                          | done    | none                        | [TASK-001](TASK-001-create-folder-structure.md) |
| TASK-002 | Define Product and ProductCategory domain models | done    | TASK-001                    | [TASK-002](TASK-002-domain-models.md) |
| TASK-003 | Define ProductRepositoryProtocol                 | done    | TASK-002                    | [TASK-003](TASK-003-repository-protocol.md) |
| TASK-004 | Create Core JSONLoader utility                   | done    | TASK-001                    | [TASK-004](TASK-004-core-json-loader.md) |
| TASK-005 | Create ProductDTO with toDomain mapping          | done    | TASK-002                    | [TASK-005](TASK-005-product-dto.md) |
| TASK-006 | Create products.json mock data                   | done    | TASK-001                    | [TASK-006](TASK-006-products-json.md) |
| TASK-007 | Create LocalProductDataSource                    | done    | TASK-004, TASK-005          | [TASK-007](TASK-007-local-product-data-source.md) |
| TASK-008 | Implement ProductRepository                      | done    | TASK-003, TASK-007          | [TASK-008](TASK-008-product-repository.md) |
| TASK-009 | Implement SearchProductsUseCase                  | done    | TASK-002                    | [TASK-009](TASK-009-search-products-use-case.md) |
| TASK-010 | Implement GroupProductsByCategoryUseCase          | done    | TASK-002                    | [TASK-010](TASK-010-group-products-use-case.md) |
| TASK-011 | Create ProductListViewModel                      | done    | TASK-008, TASK-009, TASK-010 | [TASK-011](TASK-011-product-list-viewmodel.md) |
| TASK-012 | Create ProductRowView                            | done    | TASK-002                    | [TASK-012](TASK-012-product-row-view.md) |
| TASK-013 | Create ProductSectionHeaderView                  | done    | TASK-002                    | [TASK-013](TASK-013-product-section-header-view.md) |
| TASK-014 | Create ProductListView                           | done    | TASK-011, TASK-012, TASK-013 | [TASK-014](TASK-014-product-list-view.md) |
| TASK-015 | Create ProductDetailViewModel                    | done    | TASK-002                    | [TASK-015](TASK-015-product-detail-viewmodel.md) |
| TASK-016 | Create ProductDetailView                         | done    | TASK-015                    | [TASK-016](TASK-016-product-detail-view.md) |
| TASK-017 | Wire up ContentView with NavigationStack         | pending | TASK-014, TASK-016          | [TASK-017](TASK-017-content-view.md) |
| TASK-018 | Wire up MyProductApp with dependency injection   | pending | TASK-017                    | [TASK-018](TASK-018-app-entry-point.md) |
| TASK-019 | Add product images to Assets                     | pending | TASK-006                    | [TASK-019](TASK-019-product-images.md) |
| TASK-020 | Build and verify the project compiles            | pending | TASK-018, TASK-019          | [TASK-020](TASK-020-build-and-verify.md) |
| TASK-021 | Write SearchProductsUseCase tests                | done    | TASK-009                    | [TASK-021](TASK-021-search-use-case-tests.md) |
| TASK-022 | Write GroupProductsByCategoryUseCase tests        | done    | TASK-010                    | [TASK-022](TASK-022-group-use-case-tests.md) |
| TASK-023 | Write ProductDTO mapping tests                   | pending | TASK-005                    | [TASK-023](TASK-023-dto-mapping-tests.md) |
| TASK-024 | Write ProductRepository tests                    | pending | TASK-008                    | [TASK-024](TASK-024-product-repository-tests.md) |
| TASK-025 | Write ProductListViewModel tests                 | done    | TASK-011                    | [TASK-025](TASK-025-viewmodel-tests.md) |

---

## Phases Overview

### Phase 1 - Foundation (TASK-001 to TASK-004)
Set up project structure, domain models, repository protocol, and JSON loader.

### Phase 2 - Data Layer (TASK-005 to TASK-008)
DTO, mock JSON data, data source, and repository implementation.

### Phase 3 - Business Logic (TASK-009 to TASK-010)
Search and grouping use cases.

### Phase 4 - UI: Product List (TASK-011 to TASK-014)
ViewModel, row view, section header, and list view.

### Phase 5 - UI: Product Detail (TASK-015 to TASK-016)
Detail ViewModel and detail view.

### Phase 6 - Wiring (TASK-017 to TASK-018)
Connect ContentView and app entry point with dependency injection.

### Phase 7 - Polish & Assets (TASK-019 to TASK-020)
Add images and verify the build.

### Phase 8 - Tests (TASK-021 to TASK-025)
Unit tests for use cases, DTO mapping, repository, and ViewModel.
