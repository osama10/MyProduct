//
//  ContentView.swift
//  MyProduct
//
//  Created by Osama Bin Bashir on 15.04.26.
//

import SwiftUI

struct ContentView: View {
    let container: DIContainer

    var body: some View {
        NavigationStack {
            ProductListView(container: container)
        }
    }
}

#Preview {
    ContentView(container: DIContainer())
}
