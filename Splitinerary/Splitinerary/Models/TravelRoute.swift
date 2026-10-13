import CoreLocation

enum RouteTheme: String, Equatable, Sendable {
    case green
    case sky
    case purple
}

struct RoutePoint: Equatable, Sendable {
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct TravelRoute: Equatable, Identifiable, Sendable {
    let id: Int
    let traveler: String
    let title: String
    let subtitle: String
    let address: String
    let symbol: String
    let theme: RouteTheme
    let points: [RoutePoint]

    var destination: RoutePoint { points.last! }
}

extension TravelRoute {
    static let samples: [Self] = [
        Self(
            id: 0,
            traveler: "나",
            title: "시부야 말차 크레페 맛집",
            subtitle: "웨이팅 맛집 · 도보 24분",
            address: "WITH HARAJUKU B1, Jingumae, Shibuya, Tokyo",
            symbol: "figure.walk",
            theme: .green,
            points: [
                .init(latitude: 35.66775, longitude: 139.70762),
                .init(latitude: 35.66665, longitude: 139.70655),
                .init(latitude: 35.66545, longitude: 139.70598),
                .init(latitude: 35.66430, longitude: 139.70680),
                .init(latitude: 35.66320, longitude: 139.70570),
                .init(latitude: 35.66218, longitude: 139.70442),
            ]
        ),
        Self(
            id: 1,
            traveler: "민지",
            title: "메이지 신궁 산책 코스",
            subtitle: "조용한 숲길 · 도보 38분",
            address: "1-1 Yoyogikamizonocho, Shibuya, Tokyo",
            symbol: "leaf.fill",
            theme: .sky,
            points: [
                .init(latitude: 35.66775, longitude: 139.70762),
                .init(latitude: 35.66910, longitude: 139.70610),
                .init(latitude: 35.67035, longitude: 139.70440),
                .init(latitude: 35.67165, longitude: 139.70265),
                .init(latitude: 35.67320, longitude: 139.70220),
            ]
        ),
        Self(
            id: 2,
            traveler: "준호",
            title: "오모테산도 건축 산책",
            subtitle: "사진 스폿 · 도보 31분",
            address: "Omotesando, Shibuya, Tokyo",
            symbol: "camera.fill",
            theme: .purple,
            points: [
                .init(latitude: 35.66775, longitude: 139.70762),
                .init(latitude: 35.66700, longitude: 139.70955),
                .init(latitude: 35.66605, longitude: 139.71130),
                .init(latitude: 35.66530, longitude: 139.71290),
                .init(latitude: 35.66480, longitude: 139.71420),
            ]
        ),
    ]
}
