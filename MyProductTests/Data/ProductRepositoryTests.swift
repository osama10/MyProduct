import Foundation
import Testing
@testable import MyProduct

@Suite("ProductRepository Tests")
struct ProductRepositoryTests {

    // MARK: - Mock Data Source

    private struct MockProductDataSource: ProductDataSourceProtocol {
        var dtos: [ProductDTO] = []
        var error: Error?

        func fetchProducts() throws -> [ProductDTO] {
            if let error { throw error }
            return dtos
        }
    }

    private enum TestError: Error {
        case dataSourceFailed
    }

    // MARK: - Tests

    @Test("fetchProducts returns correctly mapped domain models")
    func fetchProductsReturnsMappedModels() async throws {
        let dtos = [
            ProductDTO(id: "1", name: "Product A", imageName: "img_a", price: 10.0, description: "Desc A", category: "Cat A"),
            ProductDTO(id: "2", name: "Product B", imageName: "img_b", price: 20.0, description: "Desc B", category: "Cat B")
        ]
        let dataSource = MockProductDataSource(dtos: dtos)
        let sut = ProductRepository(dataSource: dataSource)

        let products = try await sut.fetchProducts()

        #expect(products.count == 2)
        #expect(products[0].id == "1")
        #expect(products[0].name == "Product A")
        #expect(products[0].price == 10.0)
        #expect(products[1].id == "2")
        #expect(products[1].name == "Product B")
        #expect(products[1].price == 20.0)
    }

    @Test("fetchProducts returns empty array when data source is empty")
    func fetchProductsReturnsEmptyArray() async throws {
        let dataSource = MockProductDataSource(dtos: [])
        let sut = ProductRepository(dataSource: dataSource)

        let products = try await sut.fetchProducts()

        #expect(products.isEmpty)
    }

    @Test("fetchProducts propagates data source errors")
    func fetchProductsPropagatesErrors() async {
        let dataSource = MockProductDataSource(error: TestError.dataSourceFailed)
        let sut = ProductRepository(dataSource: dataSource)

        await #expect(throws: TestError.self) {
            try await sut.fetchProducts()
        }
    }
}
