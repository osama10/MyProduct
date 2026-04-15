import Foundation
import Testing
@testable import MyProduct

@Suite("GroupProductsByCategoryUseCase Tests")
struct GroupProductsByCategoryUseCaseTests {

    private let sut = GroupProductsByCategoryUseCase()

    private let testProducts = [
        Product(id: "1", name: "iPhone 16", imageName: "iphone", price: 999, description: "A smartphone", category: "Electronics"),
        Product(id: "2", name: "MacBook Pro", imageName: "macbook", price: 1999, description: "A laptop", category: "Electronics"),
        Product(id: "3", name: "Running Shoes", imageName: "shoes", price: 120, description: "Comfortable shoes", category: "Footwear"),
        Product(id: "4", name: "Water Bottle", imageName: "bottle", price: 25, description: "Stainless steel", category: "Accessories")
    ]

    @Test("Groups products by category correctly")
    func groupsByCategory() {
        let result = sut.execute(products: testProducts)

        #expect(result.count == 3)

        let accessories = result.first { $0.name == "Accessories" }
        #expect(accessories?.products.count == 1)
        #expect(accessories?.products[0].id == "4")

        let electronics = result.first { $0.name == "Electronics" }
        #expect(electronics?.products.count == 2)

        let footwear = result.first { $0.name == "Footwear" }
        #expect(footwear?.products.count == 1)
        #expect(footwear?.products[0].id == "3")
    }

    @Test("Categories are sorted alphabetically")
    func sortedAlphabetically() {
        let result = sut.execute(products: testProducts)

        let names = result.map(\.name)
        #expect(names == ["Accessories", "Electronics", "Footwear"])
    }

    @Test("Empty input produces empty output")
    func emptyInput() {
        let result = sut.execute(products: [])
        #expect(result.isEmpty)
    }

    @Test("Single category produces one group")
    func singleCategory() {
        let electronics = testProducts.filter { $0.category == "Electronics" }
        let result = sut.execute(products: electronics)

        #expect(result.count == 1)
        #expect(result[0].name == "Electronics")
        #expect(result[0].products.count == 2)
    }
}
