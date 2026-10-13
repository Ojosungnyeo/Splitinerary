import SwiftUI

struct RouteSuggestionHeader: View {
    let route: TravelRoute

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: weatherSymbol)
                .font(.system(size: 23, weight: .semibold))
                .foregroundStyle(route.theme.color)
                .frame(width: 38, height: 38)
                .background(.white.opacity(0.9), in: Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text("SPLITinerary")
                    .font(.system(size: 10, weight: .heavy, design: .rounded))
                    .tracking(0.8)
                    .foregroundStyle(.secondary)

                Text(recommendation)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .lineLimit(2)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 12, y: 5)
    }

    private var weatherSymbol: String {
        switch route.theme {
        case .green: "cloud.sun.fill"
        case .sky: "wind"
        case .purple: "cloud.drizzle.fill"
        }
    }

    private var recommendation: String {
        switch route.theme {
        case .green: "선선한 바람과 산책 어때요?"
        case .sky: "시원한 바람이 부는 한강 어때요?"
        case .purple: "카페에서 향긋한 커피 한 잔 어때요?"
        }
    }
}
