import Foundation

/// A use case that filters products by a search query with name-match priority over category-match.
protocol SearchProductsUseCaseProtocol: Sendable {
    func execute(products: [Product], query: String) -> [Product]
}

struct SearchProductsUseCase: SearchProductsUseCaseProtocol {
    func execute(products: [Product], query: String) -> [Product] {
        let trimmedQuery = query.trimmingCharacters(in: .whitespaces)

        guard !trimmedQuery.isEmpty else {
            return products
        }

        // Name matches have strict priority
        let nameMatches = products.filter { $0.name.localizedStandardContains(trimmedQuery) }
        if !nameMatches.isEmpty {
            return nameMatches
        }

        // Fall back to category matches
        let categoryMatches = products.filter { $0.category.localizedStandardContains(trimmedQuery) }
        return categoryMatches
    }
}
