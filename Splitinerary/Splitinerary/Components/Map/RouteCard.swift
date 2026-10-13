import SwiftUI

struct RouteCard: View {
    let route: TravelRoute

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack(alignment: .top) {
                Text(route.title)
                    .font(.system(size: 19, weight: .bold, design: .rounded))
                    .lineLimit(1)

                Spacer(minLength: 10)

                Image(systemName: "arrow.up.right")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(route.theme.color)
                    .frame(width: 34, height: 34)
                    .background(.white, in: Circle())
            }

            Text(route.subtitle)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(.white.opacity(0.82))
                .lineLimit(1)

            HStack(spacing: 13) {
                Label(route.traveler, systemImage: "person.fill")
                Label("12분", systemImage: "tram.fill")
                Label("14분", systemImage: "figure.walk")
            }
            .font(.system(size: 11, weight: .semibold))
            .foregroundStyle(.white.opacity(0.94))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .frame(height: 128)
        .foregroundStyle(.white)
        .background(
            LinearGradient(
                colors: [route.theme.color.opacity(0.92), route.theme.color],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            in: RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.white.opacity(0.22), lineWidth: 1)
        }
        .shadow(color: route.theme.color.opacity(0.28), radius: 14, y: 7)
    }
}
