import Foundation

struct Product: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let imageName: String
    let price: Double
    let description: String
    let category: String
}
