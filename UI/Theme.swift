import SwiftUI

enum Theme {
    // Brand colors approximated from the Lovable site (purple + gold)
    static let brandPurple = Color(red: 88/255, green: 24/255, blue: 124/255)
    static let brandPurpleDark = Color(red: 45/255, green: 12/255, blue: 70/255)
    static let accentGold = Color(red: 242/255, green: 170/255, blue: 46/255)

    static let pageBG = {
        #if os(iOS)
        return Color(.systemGroupedBackground)
        #else
        return Color(white: 0.96)
        #endif
    }()

    static let radius: CGFloat = 16
    static let pad: CGFloat = 16

    static func heroOverlay() -> LinearGradient {
        LinearGradient(
            colors: [brandPurpleDark.opacity(0.75), brandPurple.opacity(0.55)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    static func purpleBand() -> LinearGradient {
        LinearGradient(
            colors: [brandPurpleDark, brandPurple],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
