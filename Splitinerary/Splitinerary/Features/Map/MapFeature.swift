import ComposableArchitecture

@Reducer
struct MapFeature {
    @ObservableState
    struct State {
        var routes = IdentifiedArrayOf<TravelRoute>(uniqueElements: TravelRoute.samples)
        var selectedRouteID: TravelRoute.ID? = TravelRoute.samples.first?.id
        var isMenuPresented = false
        var showsAllRoutes = false
    }

    enum Action {
        case routeCardSwiped(TravelRoute.ID?)
        case routeTapped(TravelRoute.ID)
        case menuButtonTapped
        case showAllRoutesTapped
        case menuDismissed
    }

    var body: Reduce<State, Action> {
        Reduce { state, action in
            switch action {
            case let .routeCardSwiped(id):
                guard let id, state.routes[id: id] != nil else { return .none }
                state.selectedRouteID = id
                state.showsAllRoutes = false
                return .none

            case let .routeTapped(id):
                state.selectedRouteID = id
                state.showsAllRoutes = false
                return .none

            case .menuButtonTapped:
                state.isMenuPresented = true
                return .none

            case .showAllRoutesTapped:
                state.showsAllRoutes = true
                state.isMenuPresented = false
                return .none

            case .menuDismissed:
                state.isMenuPresented = false
                return .none
            }
        }
    }
}
