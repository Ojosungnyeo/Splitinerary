//
//  ContentView.swift
//  Splitinerary
//
//  Created by sun on 10/13/26.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<MapFeature>

    var body: some View {
        RoutesMapView(store: store)
    }
}

#Preview {
    ContentView(
        store: Store(initialState: MapFeature.State()) {
            MapFeature()
        }
    )
}
