import SwiftUI

struct NewsView: View {
    var body: some View {
        ScrollView {
            SectionTitle(title: "Latest News & Events")
            NewsGrid(items: MockData.news)
        }
        .background(Theme.pageBG)
        .navigationTitle("News")
    }
}

struct NewsGrid: View {
    let items: [NewsItem]
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 14) {
            ForEach(items) { item in
                NavigationLink {
                    NewsDetailView(item: item)
                } label: {
                    NewsCard(item: item)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, Theme.pad)
        .padding(.bottom, 20)
    }
}

struct NewsCard: View {
    let item: NewsItem

    var body: some View {
        CardContainer {
            VStack(alignment: .leading, spacing: 10) {
                RemoteImage(urlString: item.imageURL)
                    .frame(height: 120)
                    .clipped()

                VStack(alignment: .leading, spacing: 8) {
                    Pill(text: item.category)
                    Text(item.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .lineLimit(3)
                    Text(item.dateText)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(12)
            }
        }
    }
}

struct NewsDetailView: View {
    let item: NewsItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                ZStack(alignment: .bottomLeading) {
                    RemoteImage(urlString: item.imageURL)
                        .frame(height: 220)
                        .clipped()

                    LinearGradient(colors: [.clear, .black.opacity(0.65)], startPoint: .top, endPoint: .bottom)

                    VStack(alignment: .leading, spacing: 8) {
                        Pill(text: item.category)
                        Text(item.title)
                            .font(.title.weight(.bold))
                            .foregroundStyle(.white)
                        Text(item.dateText)
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .padding(16)
                }
                .clipShape(RoundedRectangle(cornerRadius: Theme.radius, style: .continuous))
                .padding(.horizontal, Theme.pad)
                .padding(.top, 10)

                Text(item.body)
                    .padding(.horizontal, Theme.pad)

                Spacer(minLength: 24)
            }
        }
        .background(Theme.pageBG)
        .navigationTitle("Details")
        .navigationInline()
    }
}
