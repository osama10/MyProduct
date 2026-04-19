import Foundation

@MainActor
struct DIContainer: Sendable {
    let repository: ProductRepositoryProtocol
    let searchUseCase: SearchProductsUseCaseProtocol
    let groupUseCase: GroupProductsByCategoryUseCaseProtocol

    init() {
        let dataSource = LocalProductDataSource()
        self.repository = ProductRepository(dataSource: dataSource)
        self.searchUseCase = SearchProductsUseCase()
        self.groupUseCase = GroupProductsByCategoryUseCase()
    }
}
