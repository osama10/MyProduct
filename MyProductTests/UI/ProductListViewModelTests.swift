import Foundation
import Testing
@testable import MyProduct

// MARK: - Mocks

private struct MockSearchProductsUseCase: SearchProductsUseCaseProtocol {
    func execute(products: [Product], query: String) -> [Product] {
        let trimmed = query.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return products }
        return products.filter { $0.name.localizedStandardContains(trimmed) }
    }
}

private struct MockGroupProductsByCategoryUseCase: GroupProductsByCategoryUseCaseProtocol {
    func execute(products: [Product]) -> [ProductCategory] {
        Dictionary(grouping: products, by: \.category)
            .map { ProductCategory(name: $0.key, products: $0.value) }
            .sorted { $0.name < $1.name }
    }
}

// MARK: - Tests

@Suite("ProductListViewModel Tests")
@MainActor
struct ProductListViewModelTests {

    private let testProducts = [
        Product(id: "1", name: "iPhone 16", imageName: "iphone", price: 999, description: "A smartphone", category: "Electronics"),
        Product(id: "2", name: "MacBook Pro", imageName: "macbook", price: 1999, description: "A laptop", category: "Electronics"),
        Product(id: "3", name: "Running Shoes", imageName: "shoes", price: 120, description: "Comfortable shoes", category: "Footwear"),
        Product(id: "4", name: "Water Bottle", imageName: "bottle", price: 25, description: "Stainless steel", category: "Accessories")
    ]

    private func makeSUT(products: [Product]? = nil, error: Error? = nil) -> ProductListViewModel {
        let repo = MockProductRepository(products: products ?? testProducts, error: error)
        return ProductListViewModel(
            repository: repo,
            searchUseCase: MockSearchProductsUseCase(),
            groupUseCase: MockGroupProductsByCategoryUseCase()
        )
    }

    @Test("Initial state is idle")
    func initialState() {
        let sut = makeSUT()
        guard case .idle = sut.state else {
            Issue.record("Expected .idle state")
            return
        }
        #expect(sut.searchText.isEmpty)
        #expect(sut.categories.isEmpty)
    }

    @Test("Load products transitions to success state")
    func loadProducts() async {
        let sut = makeSUT()
        await sut.loadProducts()

        guard case .success(let products) = sut.state else {
            Issue.record("Expected .success state")
            return
        }
        #expect(products.count == 4)
    }

    @Test("Load products transitions to error state on failure")
    func loadProductsError() async {
        let sut = makeSUT(products: [], error: NSError(domain: "test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Load failed"]))
        await sut.loadProducts()

        guard case .error(let message) = sut.state else {
            Issue.record("Expected .error state")
            return
        }
        #expect(message == "Load failed")
        #expect(sut.categories.isEmpty)
    }

    @Test("Categories returns all products grouped when search is empty")
    func categoriesWithEmptySearch() async {
        let sut = makeSUT()
        await sut.loadProducts()

        let categories = sut.categories
        #expect(categories.count == 3)
        #expect(categories.map(\.name) == ["Accessories", "Electronics", "Footwear"])
    }

    @Test("Categories filters by search text through pipeline")
    func categoriesWithSearchText() async {
        let sut = makeSUT()
        await sut.loadProducts()

        sut.searchText = "iPhone"
        let categories = sut.categories
        #expect(categories.count == 1)
        #expect(categories[0].name == "Electronics")
        #expect(categories[0].products.count == 1)
        #expect(categories[0].products[0].name == "iPhone 16")
    }

    @Test("Search with no matches returns empty categories")
    func searchNoMatches() async {
        let sut = makeSUT()
        await sut.loadProducts()

        sut.searchText = "NonExistent"
        #expect(sut.categories.isEmpty)
    }

    @Test("Search filters across multiple categories correctly")
    func searchAcrossCategories() async {
        let products = [
            Product(id: "1", name: "Blue Shirt", imageName: "shirt", price: 30, description: "A shirt", category: "Clothing"),
            Product(id: "2", name: "Blue Vase", imageName: "vase", price: 50, description: "A vase", category: "Home"),
            Product(id: "3", name: "Red Hat", imageName: "hat", price: 20, description: "A hat", category: "Clothing")
        ]
        let sut = makeSUT(products: products)
        await sut.loadProducts()

        sut.searchText = "Blue"
        let categories = sut.categories
        #expect(categories.count == 2)

        let totalProducts = categories.flatMap(\.products)
        #expect(totalProducts.count == 2)
        #expect(totalProducts.allSatisfy { $0.name.contains("Blue") })
    }

    @Test("Clearing search text restores all categories")
    func clearSearchRestoresAll() async {
        let sut = makeSUT()
        await sut.loadProducts()

        sut.searchText = "iPhone"
        #expect(sut.categories.count == 1)

        sut.searchText = ""
        #expect(sut.categories.count == 3)
    }
}
