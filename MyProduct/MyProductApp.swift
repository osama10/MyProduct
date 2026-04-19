//
//  MyProductApp.swift
//  MyProduct
//
//  Created by Osama Bin Bashir on 15.04.26.
//

import SwiftUI

@main
struct MyProductApp: App {
    @State private var container = DIContainer()

    var body: some Scene {
        WindowGroup {
            ContentView(container: container)
        }
    }
}
