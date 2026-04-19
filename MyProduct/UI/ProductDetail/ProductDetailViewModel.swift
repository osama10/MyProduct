import Foundation

@Observable
@MainActor
final class ProductDetailViewModel {
    let product: Product

    init(product: Product) {
        self.product = product
    }
}
