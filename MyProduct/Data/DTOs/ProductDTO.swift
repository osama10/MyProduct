import Foundation

/// A Codable data transfer object that mirrors the domain Product model.
/// Used to decode product data from JSON, keeping Codable concerns out of the domain layer.
struct ProductDTO: Codable, Sendable {
    let id: String
    let name: String
    let imageName: String
    let price: Double
    let description: String
    let category: String

    /// Maps this DTO to a domain `Product` instance.
    func toDomain() -> Product {
        Product(
            id: id,
            name: name,
            imageName: imageName,
            price: price,
            description: description,
            category: category
        )
    }
}
