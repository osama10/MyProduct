import Foundation

/// A use case that groups products by category, returning categories sorted alphabetically.
protocol GroupProductsByCategoryUseCaseProtocol: Sendable {
    func execute(products: [Product]) -> [ProductCategory]
}

struct GroupProductsByCategoryUseCase: GroupProductsByCategoryUseCaseProtocol {
    func execute(products: [Product]) -> [ProductCategory] {
        let grouped = Dictionary(grouping: products, by: \.category)

        return grouped
            .map { ProductCategory(name: $0.key, products: $0.value) }
            .sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
    }
}
