import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            HeroBanner(
                title: "About Us",
                subtitle: "Discover the legacy, vision, and mission of Ascend University",
                imageURL: MockData.heroCampus
            )

            SectionTitle(title: "Our Story")
            CardContainer {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MockData.aboutStory, id: \.self) { p in
                        Text(p)
                            .font(.body)
                            .foregroundStyle(.primary)
                    }
                }
                .padding(16)
            }
            .padding(.horizontal, Theme.pad)

            SectionTitle(title: "Vision, Mission & Values")
            ValuesGrid(values: MockData.values)

            SectionTitle(title: "Leadership")
            Text(MockData.leadershipIntro)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal, Theme.pad)
                .padding(.bottom, 6)

            LeadersRow(leaders: MockData.leaders)

            Spacer(minLength: 24)
        }
        .background(Theme.pageBG)
        .navigationTitle("About")
        .navigationInline()
    }
}

struct ValuesGrid: View {
    let values: [ValueCard]
    private let cols = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: cols, spacing: 12) {
            ForEach(values) { v in
                CardContainer {
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: v.systemIcon)
                            .foregroundStyle(Theme.brandPurple)
                            .font(.title3.weight(.semibold))
                        Text(v.title)
                            .font(.headline)
                        Text(v.body)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(6)
                        Spacer(minLength: 0)
                    }
                    .padding(14)
                    .frame(minHeight: 160, alignment: .topLeading)
                }
            }
        }
        .padding(.horizontal, Theme.pad)
    }
}

struct LeadersRow: View {
    let leaders: [LeaderCard]
    private let cols = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: cols, spacing: 12) {
            ForEach(leaders) { l in
                CardContainer {
                    VStack(spacing: 10) {
                        Image(systemName: "person.2.fill")
                            .foregroundStyle(.white)
                            .frame(width: 44, height: 44)
                            .background(Theme.brandPurple)
                            .clipShape(Circle())
                        Text(l.role)
                            .font(.headline)
                        Text(l.org)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(14)
                }
            }
        }
        .padding(.horizontal, Theme.pad)
        .padding(.bottom, 20)
    }
}
