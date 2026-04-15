import Foundation

/// Concrete repository that bridges the Data and Domain layers.
/// Fetches product DTOs from a data source and maps them to domain models.
struct ProductRepository: ProductRepositoryProtocol {
    private let dataSource: ProductDataSourceProtocol

    init(dataSource: ProductDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func fetchProducts() async throws -> [Product] {
        try dataSource.fetchProducts().map { $0.toDomain() }
    }
}
