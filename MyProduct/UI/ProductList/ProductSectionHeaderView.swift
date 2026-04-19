import SwiftUI

struct ProductSectionHeaderView: View {
    let categoryName: String

    var body: some View {
        Text(categoryName)
            .font(.title3)
            .bold()
            .foregroundStyle(.primary)
    }
}

#Preview {
    ProductSectionHeaderView(categoryName: "Electronics")
        .padding()
}
