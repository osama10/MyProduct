import Foundation

enum ViewState {
    case idle
    case loading
    case success([Product])
    case error(String)
}

@Observable
@MainActor
final class ProductListViewModel {

    // MARK: - State

    var searchText = ""
    private(set) var state: ViewState = .idle

    var categories: [ProductCategory] {
        let filtered = searchUseCase.execute(products: allProducts, query: searchText)
        return groupUseCase.execute(products: filtered)
    }

    private var allProducts: [Product] {
        if case .success(let products) = state { return products }
        return []
    }

    // MARK: - Dependencies

    private let repository: ProductRepositoryProtocol
    private let searchUseCase: SearchProductsUseCaseProtocol
    private let groupUseCase: GroupProductsByCategoryUseCaseProtocol

    // MARK: - Init

    init(
        repository: ProductRepositoryProtocol,
        searchUseCase: SearchProductsUseCaseProtocol,
        groupUseCase: GroupProductsByCategoryUseCaseProtocol
    ) {
        self.repository = repository
        self.searchUseCase = searchUseCase
        self.groupUseCase = groupUseCase
    }

    // MARK: - Actions

    func loadProducts() async {
        state = .loading

        do {
            let products = try await repository.fetchProducts()
            state = .success(products)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
