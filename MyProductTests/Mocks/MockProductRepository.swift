import Foundation
@testable import MyProduct

struct MockProductRepository: ProductRepositoryProtocol {
    var products: [Product] = []
    var error: Error?

    func fetchProducts() async throws -> [Product] {
        if let error { throw error }
        return products
    }
}
