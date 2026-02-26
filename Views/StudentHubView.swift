import SwiftUI

struct StudentHubView: View {
    var body: some View {
        ScrollView {
            HeroBanner(
                title: "Student Hub",
                subtitle: "Everything you need for a successful university experience",
                imageURL: MockData.heroStudents
            )

            HubGrid(features: MockData.hubFeatures)

            NeedHelpCard()
        }
        .background(Theme.pageBG)
        .navigationTitle("Hub")
        .navigationInline()
    }
}

struct HubGrid: View {
    let features: [HubFeature]
    private let cols = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: cols, spacing: 14) {
            ForEach(features) { f in
                NavigationLink {
                    HubFeatureDetailView(feature: f)
                } label: {
                    HubCard(feature: f)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, Theme.pad)
        .padding(.vertical, 12)
    }
}

struct HubCard: View {
    let feature: HubFeature

    var body: some View {
        CardContainer {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: feature.systemIcon)
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.white)
                    .frame(width: 42, height: 42)
                    .background(Theme.brandPurple)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

                Text(feature.title)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(feature.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(4)

                Spacer(minLength: 0)
            }
            .padding(14)
            .frame(minHeight: 160, alignment: .topLeading)
        }
    }
}

struct HubFeatureDetailView: View {
    let feature: HubFeature

    var body: some View {
        ScrollView {
            CardContainer {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 12) {
                        Image(systemName: feature.systemIcon)
                            .font(.title.weight(.semibold))
                            .foregroundStyle(.white)
                            .frame(width: 54, height: 54)
                            .background(Theme.brandPurple)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(feature.title)
                                .font(.title2.weight(.bold))
                            Text(feature.subtitle)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }

                    Text(feature.details)
                        .font(.body)
                        .foregroundStyle(.primary)
                }
                .padding(16)
            }
            .padding(.horizontal, Theme.pad)
            .padding(.top, 10)

            Spacer(minLength: 24)
        }
        .background(Theme.pageBG)
        .navigationTitle(feature.title)
        .navigationInline()
    }
}

struct NeedHelpCard: View {
    @State private var show = false

    var body: some View {
        CardContainer {
            VStack(alignment: .leading, spacing: 10) {
                Text("Need Help?")
                    .font(.headline)

                Text("Our student support team is here to help you with any questions or concerns. Reach out to us anytime.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Button("Contact Student Support") { show = true }
                    .buttonStyle(PrimaryCapsuleButtonStyle())
                    .padding(.top, 4)
            }
            .padding(16)
        }
        .padding(.horizontal, Theme.pad)
        .padding(.bottom, 20)
        .alert("Student Support", isPresented: $show) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Frontend-only demo. Connect this button to email/phone/chat later.")
        }
    }
}
