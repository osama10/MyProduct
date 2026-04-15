import Foundation

protocol ProductRepositoryProtocol: Sendable {
    func fetchProducts() async throws -> [Product]
}
