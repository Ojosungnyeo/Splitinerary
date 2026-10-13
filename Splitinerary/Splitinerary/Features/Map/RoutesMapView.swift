import ComposableArchitecture
import MapKit
import SwiftUI

struct RoutesMapView: View {
    let store: StoreOf<MapFeature>

    private var selectedRoute: TravelRoute? {
        guard let id = store.selectedRouteID else { return store.routes.first }
        return store.routes[id: id]
    }

    var body: some View {
        ZStack {
            Map(initialPosition: .region(Self.initialRegion)) {
                if store.showsAllRoutes {
                    ForEach(store.routes) { route in
                        MapPolyline(coordinates: route.points.map(\.coordinate))
                            .stroke(
                                route.theme.color,
                                style: StrokeStyle(
                                    lineWidth: 10,
                                    lineCap: .round,
                                    lineJoin: .round
                                )
                            )

                        Annotation(route.traveler, coordinate: route.destination.coordinate) {
                            RoutePin(
                                symbol: route.symbol,
                                color: route.theme.color
                            )
                        }
                    }
                } else if let route = selectedRoute {
                    MapPolyline(coordinates: route.points.map(\.coordinate))
                        .stroke(
                            route.theme.color,
                            style: StrokeStyle(
                                lineWidth: 12,
                                lineCap: .round,
                                lineJoin: .round
                            )
                        )

                    Annotation(route.traveler, coordinate: route.destination.coordinate) {
                        RoutePin(symbol: route.symbol, color: route.theme.color)
                    }
                }
            }
            .mapStyle(
                .standard(
                    elevation: .flat,
                    emphasis: .muted,
                    pointsOfInterest: .excludingAll,
                    showsTraffic: false
                )
            )
            .mapControls { }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    if let route = selectedRoute {
                        RouteSuggestionHeader(route: route)
                    }

                    Spacer(minLength: 16)
                    menuButton
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                Spacer(minLength: 0)

                RouteCarousel(
                    routes: store.routes,
                    selectedRouteID: Binding(
                        get: { store.selectedRouteID },
                        set: { store.send(.routeCardSwiped($0)) }
                    )
                )
                .padding(.bottom, 12)
            }
        }
        .confirmationDialog(
            "지도 메뉴",
            isPresented: Binding(
                get: { store.isMenuPresented },
                set: { if !$0 { store.send(.menuDismissed) } }
            )
        ) {
            Button("전체 동선 보기") {
                store.send(.showAllRoutesTapped, animation: .easeInOut(duration: 0.25))
            }
            Button("닫기", role: .cancel) { store.send(.menuDismissed) }
        }
    }

    private var menuButton: some View {
        Button {
            store.send(.menuButtonTapped)
        } label: {
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 54, height: 54)
                .background(.black.opacity(0.42), in: Circle())
        }
        .accessibilityLabel("메뉴")
    }

    private static let initialRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6677, longitude: 139.7082),
        span: MKCoordinateSpan(latitudeDelta: 0.014, longitudeDelta: 0.014)
    )
}

#Preview {
    RoutesMapView(
        store: Store(initialState: MapFeature.State()) {
            MapFeature()
        }
    )
}
