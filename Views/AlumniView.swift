import SwiftUI

struct AlumniView: View {
    @State private var showRegister = false

    var body: some View {
        ScrollView {
            HeroBanner(
                title: "Alumni",
                subtitle: "Stay connected with the Ascend University family",
                imageURL: MockData.heroGraduation
            )

            AlumniGrid(items: MockData.alumniPillars)

            CardContainer {
                VStack(spacing: 10) {
                    Text("Join the Alumni Association")
                        .font(.title3.weight(.bold))

                    Text("Stay updated with university news, access exclusive benefits, and reconnect with your batchmates.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)

                    Button("Register Now") { showRegister = true }
                        .buttonStyle(GoldCapsuleButtonStyle())
                        .padding(.top, 6)
                }
                .padding(18)
            }
            .padding(.horizontal, Theme.pad)
            .padding(.bottom, 20)
        }
        .background(Theme.pageBG)
        .navigationTitle("Alumni")
        .navigationInline()
        .alert("Register", isPresented: $showRegister) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Frontend-only demo. Connect this to a real registration flow later.")
        }
    }
}

struct AlumniGrid: View {
    let items: [AlumniPillar]
    private let cols = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: cols, spacing: 14) {
            ForEach(items) { item in
                CardContainer {
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: item.systemIcon)
                            .foregroundStyle(Theme.brandPurple)
                            .font(.title3.weight(.semibold))
                        Text(item.title)
                            .font(.headline)
                        Text(item.subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Spacer(minLength: 0)
                    }
                    .padding(14)
                    .frame(minHeight: 150, alignment: .topLeading)
                }
            }
        }
        .padding(.horizontal, Theme.pad)
        .padding(.vertical, 12)
    }
}
