import SwiftUI

struct HeroCarouselView: View {
    let slides: [HeroSlide]

    var body: some View {
        TabView {
            ForEach(slides) { slide in
                ZStack {
                    RemoteImage(urlString: slide.imageURL)
                        .frame(height: 300)
                        .clipped()

                    Theme.heroOverlay()

                    VStack(spacing: 10) {
                        Text(slide.title)
                            .font(.system(size: 34, weight: .bold, design: .serif))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)

                        Text(slide.subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.9))
                            .multilineTextAlignment(.center)

                        Button(slide.cta) { slide.onTap() }
                            .buttonStyle(GoldCapsuleButtonStyle())
                            .padding(.top, 6)
                    }
                    .padding(.horizontal, 18)
                }
                .clipShape(RoundedRectangle(cornerRadius: Theme.radius, style: .continuous))
                .padding(.horizontal, Theme.pad)
                .padding(.top, 10)
            }
        }
        .frame(height: 330)
        #if os(iOS)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        #endif
    }
}

struct HeroBanner: View {
    let title: String
    let subtitle: String
    let imageURL: String

    var body: some View {
        ZStack {
            RemoteImage(urlString: imageURL)
                .frame(height: 220)
                .clipped()

            Theme.heroOverlay()

            VStack(spacing: 8) {
                Text(title)
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundStyle(.white)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: Theme.radius, style: .continuous))
        .padding(.horizontal, Theme.pad)
        .padding(.top, 10)
    }
}
