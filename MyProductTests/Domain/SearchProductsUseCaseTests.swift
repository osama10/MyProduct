import Foundation
import Testing
@testable import MyProduct

@Suite("SearchProductsUseCase Tests")
@MainActor
struct SearchProductsUseCaseTests {

    private let sut = SearchProductsUseCase()

    private let testProducts = [
        Product(id: "1", name: "iPhone 16", imageName: "iphone", price: 999, description: "A smartphone", category: "Electronics"),
        Product(id: "2", name: "MacBook Pro", imageName: "macbook", price: 1999, description: "A laptop", category: "Electronics"),
        Product(id: "3", name: "Running Shoes", imageName: "shoes", price: 120, description: "Comfortable shoes", category: "Footwear"),
        Product(id: "4", name: "Café Blend", imageName: "coffee", price: 15, description: "Premium coffee", category: "Beverages"),
        Product(id: "5", name: "Water Bottle", imageName: "bottle", price: 25, description: "Stainless steel", category: "Accessories")
    ]

    @Test("Empty query returns all products")
    func emptyQueryReturnsAll() {
        let result = sut.execute(products: testProducts, query: "")
        #expect(result == testProducts)
    }

    @Test("Whitespace-only query returns all products")
    func whitespaceQueryReturnsAll() {
        let result = sut.execute(products: testProducts, query: "   ")
        #expect(result == testProducts)
    }

    @Test("Query matching product name returns only name matches")
    func nameMatchExcludesCategoryMatches() {
        let result = sut.execute(products: testProducts, query: "MacBook")
        #expect(result.count == 1)
        #expect(result[0].id == "2")
    }

    @Test("Query matching only a category returns all products in that category")
    func categoryFallback() {
        let result = sut.execute(products: testProducts, query: "Footwear")
        #expect(result.count == 1)
        #expect(result[0].id == "3")
    }

    @Test("No matches returns empty array")
    func noMatchesReturnsEmpty() {
        let result = sut.execute(products: testProducts, query: "xyz123")
        #expect(result.isEmpty)
    }

    @Test("Search is case-insensitive")
    func caseInsensitive() {
        let result = sut.execute(products: testProducts, query: "iphone")
        #expect(result.count == 1)
        #expect(result[0].id == "1")
    }

    @Test("Search is diacritic-insensitive")
    func diacriticInsensitive() {
        let result = sut.execute(products: testProducts, query: "cafe")
        #expect(result.count == 1)
        #expect(result[0].id == "4")
    }

    @Test("Name matches take priority over category matches")
    func namePriorityOverCategory() {
        // "Electronics" appears in category for products 1 & 2,
        // but no product name contains "Electronics", so category fallback applies
        let categoryResult = sut.execute(products: testProducts, query: "Electronics")
        #expect(categoryResult.count == 2)
        #expect(categoryResult.map(\.id).contains("1"))
        #expect(categoryResult.map(\.id).contains("2"))

        // "Shoes" appears in the name of product 3 AND in the category "Footwear" (not matching)
        // Only name match should be returned
        let nameResult = sut.execute(products: testProducts, query: "Shoes")
        #expect(nameResult.count == 1)
        #expect(nameResult[0].id == "3")
    }
}
