//
//  ContentView.swift
//  MyProduct
//
//  Created by Osama Bin Bashir on 15.04.26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel: ProductListViewModel

    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            ProductListView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView(
        viewModel: ProductListViewModel(
            repository: ProductRepository(
                dataSource: LocalProductDataSource()
            ),
            searchUseCase: SearchProductsUseCase(),
            groupUseCase: GroupProductsByCategoryUseCase()
        )
    )
}
