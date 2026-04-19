import SwiftUI

struct ProductDetailView: View {
    var viewModel: ProductDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Image(systemName: viewModel.product.imageName)
                    .font(.system(size: 80))
                    .frame(maxWidth: .infinity, minHeight: 200)
                    .background(.quaternary)
                    .clipShape(.rect(cornerRadius: 12))

                Text(viewModel.product.price, format: .currency(code: "USD"))
                    .font(.title2)
                    .bold()

                Text(viewModel.product.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle(viewModel.product.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(
            viewModel: ProductDetailViewModel(
                product: Product(
                    id: "preview-001",
                    name: "Wireless Headphones",
                    imageName: "headphones",

                    price: 79.99,
                    description: "Premium over-ear wireless headphones with active noise cancellation and 30-hour battery life.",
                    category: "Electronics"
                )
            )
        )
    }
}
