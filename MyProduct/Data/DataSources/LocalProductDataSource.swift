import Foundation

/// Abstraction for fetching raw product DTOs from a local data source.
protocol ProductDataSourceProtocol: Sendable {
    func fetchProducts() throws -> [ProductDTO]
}

/// Loads product DTOs from a bundled JSON file using `loadJSON`.
struct LocalProductDataSource: ProductDataSourceProtocol {
    private let bundle: Bundle
    private let filename: String

    init(bundle: Bundle = .main, filename: String = "products.json") {
        self.bundle = bundle
        self.filename = filename
    }

    func fetchProducts() throws -> [ProductDTO] {
        try loadJSON(filename, from: bundle)
    }
}
