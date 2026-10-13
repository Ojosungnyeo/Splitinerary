import SwiftUI

struct RoutePin: View {
    let symbol: String
    let color: Color

    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: symbol)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 42, height: 42)
                .background(color, in: Circle())
                .overlay(Circle().stroke(.white, lineWidth: 3))

            Capsule()
                .fill(color)
                .frame(width: 6, height: 18)
                .offset(y: -2)
        }
        .shadow(color: .black.opacity(0.15), radius: 5, y: 3)
    }
}
