import SwiftUI

struct ProductListView: View {
    @Bindable var viewModel: ProductListViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle:
                EmptyView()

            case .loading:
                ProgressView("Loading products…")

            case .success:
                List {
                    ForEach(viewModel.categories) { category in
                        Section {
                            ForEach(category.products) { product in
                                NavigationLink(value: product) {
                                    ProductRowView(product: product)
                                }
                            }
                        } header: {
                            ProductSectionHeaderView(categoryName: category.name)
                        }
                    }
                }
                .searchable(text: $viewModel.searchText, prompt: "Search products")

            case .error(let message):
                ContentUnavailableView(
                    "Unable to Load Products",
                    systemImage: "exclamationmark.triangle",
                    description: Text(message)
                )
            }
        }
        .navigationTitle("Products")
        .navigationDestination(for: Product.self) { product in
            // Placeholder until TASK-016 implements ProductDetailView
            Text(product.name)
        }
        .task {
            await viewModel.loadProducts()
        }
    }
}

#Preview {
    NavigationStack {
        ProductListView(
            viewModel: {
                let viewModel = ProductListViewModel(
                    repository: ProductRepository(
                        dataSource: LocalProductDataSource()
                    ),
                    searchUseCase: SearchProductsUseCase(),
                    groupUseCase: GroupProductsByCategoryUseCase()
                )
                return viewModel
            }()
        )
    }
}
