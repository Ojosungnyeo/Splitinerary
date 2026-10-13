import IdentifiedCollections
import SwiftUI

struct RouteCarousel: View {
    let routes: IdentifiedArrayOf<TravelRoute>
    @Binding var selectedRouteID: TravelRoute.ID?

    var body: some View {
        VStack(spacing: 9) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(routes) { route in
                        RouteCard(route: route)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 32)
                            .id(route.id)
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 128)
            .contentMargins(.horizontal, 20, for: .scrollContent)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $selectedRouteID)
            .onScrollTargetVisibilityChange(idType: TravelRoute.ID.self, threshold: 0.6) { visibleIDs in
                guard let visibleID = visibleIDs.first, visibleID != selectedRouteID else { return }
                selectedRouteID = visibleID
            }

            HStack(spacing: 7) {
                ForEach(routes) { route in
                    Circle()
                        .fill(route.id == selectedRouteID ? route.theme.color : Color.white.opacity(0.78))
                        .frame(width: route.id == selectedRouteID ? 9 : 7, height: route.id == selectedRouteID ? 9 : 7)
                        .overlay(Circle().stroke(.black.opacity(0.12), lineWidth: 0.5))
                }
            }
            .animation(.snappy, value: selectedRouteID)
        }
    }
}
