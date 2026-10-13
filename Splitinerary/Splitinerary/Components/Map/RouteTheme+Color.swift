import SwiftUI

extension RouteTheme {
    var color: Color {
        switch self {
        case .green:
            Color(red: 0.34, green: 0.76, blue: 0.55)
        case .sky:
            Color(red: 0.34, green: 0.63, blue: 0.93)
        case .purple:
            Color(red: 0.60, green: 0.49, blue: 0.88)
        }
    }
}
