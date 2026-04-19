import Foundation
import Testing
@testable import MyProduct

@Suite("ProductDTO Mapping Tests")
struct ProductDTOMappingTests {

    @Test("toDomain maps all properties correctly")
    func toDomainMapsAllProperties() {
        let dto = ProductDTO(
            id: "test-001",
            name: "Test Product",
            imageName: "test_image",
            price: 49.99,
            description: "A test product description.",
            category: "Test Category"
        )

        let product = dto.toDomain()

        #expect(product.id == "test-001")
        #expect(product.name == "Test Product")
        #expect(product.imageName == "test_image")
        #expect(product.price == 49.99)
        #expect(product.description == "A test product description.")
        #expect(product.category == "Test Category")
    }

    @Test("toDomain handles empty strings")
    func toDomainHandlesEmptyStrings() {
        let dto = ProductDTO(
            id: "",
            name: "",
            imageName: "",
            price: 0,
            description: "",
            category: ""
        )

        let product = dto.toDomain()

        #expect(product.id == "")
        #expect(product.name == "")
        #expect(product.imageName == "")
        #expect(product.price == 0)
        #expect(product.description == "")
        #expect(product.category == "")
    }
}
