//
//  SplitineraryApp.swift
//  Splitinerary
//
//  Created by sun on 10/13/26.
//

import SwiftUI
import ComposableArchitecture

@main
struct SplitineraryApp: App {
    static let store = Store(initialState: MapFeature.State()) {
        MapFeature()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(store: Self.store)
        }
    }
}
