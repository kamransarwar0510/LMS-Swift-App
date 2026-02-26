import SwiftUI

struct SectionTitle: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2.weight(.semibold))
            Spacer()
        }
        .padding(.horizontal, Theme.pad)
        .padding(.top, 6)
    }
}

struct Pill: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.caption.weight(.semibold))
            .foregroundStyle(Theme.brandPurple)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Theme.brandPurple.opacity(0.10))
            .clipShape(Capsule())
    }
}

struct CardContainer<Content: View>: View {
    @ViewBuilder var content: Content
    var body: some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: Theme.radius, style: .continuous))
            .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 6)
    }
}

struct PrimaryCapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline.weight(.semibold))
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(Theme.brandPurple.opacity(configuration.isPressed ? 0.85 : 1.0))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

struct GoldCapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(Theme.accentGold.opacity(configuration.isPressed ? 0.85 : 1.0))
            .foregroundStyle(.black)
            .clipShape(Capsule())
    }
}

extension View {
    @ViewBuilder
    func navigationInline() -> some View {
        #if os(iOS)
        self.navigationBarTitleDisplayMode(.inline)
        #else
        self
        #endif
    }
}

extension ToolbarItemPlacement {
    static var primaryPlacement: ToolbarItemPlacement {
        #if os(iOS)
        return .topBarTrailing
        #else
        return .primaryAction
        #endif
    }
}
