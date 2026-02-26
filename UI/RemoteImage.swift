import SwiftUI

/// Simple remote image loader for frontend-only app.
/// Uses AsyncImage (iOS 15+). Shows a tasteful placeholder while loading.
struct RemoteImage: View {
    let urlString: String?
    var contentMode: ContentMode = .fill

    var body: some View {
        if let urlString, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                case .failure:
                    placeholder
                @unknown default:
                    placeholder
                }
            }
        } else {
            placeholder
        }
    }

    private var placeholder: some View {
        ZStack {
            Rectangle()
                .fill(Theme.brandPurple.opacity(0.18))
            Image(systemName: "photo")
                .font(.title2)
                .foregroundStyle(Theme.brandPurple.opacity(0.7))
        }
    }
}
