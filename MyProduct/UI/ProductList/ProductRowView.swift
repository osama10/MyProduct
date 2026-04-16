import SwiftUI

struct ProductRowView: View {
    let product: Product

    var body: some View {
        HStack {
            Image(decorative: product.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)

                Text(product.price, format: .currency(code: "USD"))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    ProductRowView(
        product: Product(
            id: "preview-001",
            name: "Wireless Headphones",
            imageName: "headphones",
            price: 79.99,
            description: "Premium over-ear wireless headphones with active noise cancellation and 30-hour battery life.",
            category: "Electronics"
        )
    )
    .padding()
}
