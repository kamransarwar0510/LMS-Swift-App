import SwiftUI

struct HomeView: View {
    @State private var showApplyToast = false

    private func apply() {
        showApplyToast = true
    }

    var body: some View {
        ScrollView {
            HeroCarouselView(slides: MockData.heroSlides(applyAction: apply))

            // Study with us
            SectionTitle(title: "Study with us")
            ProgramCardRow(programs: MockData.programs)

            Button("Admissions Open Spring 2026 — Apply Now") { apply() }
                .buttonStyle(PrimaryCapsuleButtonStyle())
                .padding(.horizontal, Theme.pad)
                .padding(.bottom, 6)

            // Faculties
            SectionTitle(title: "Explore our Faculties")
            FacultyGrid(items: MockData.faculties)

            // Purple rankings band
            RankingsBand(stats: MockData.stats)

            // Latest News
            SectionTitle(title: "Latest News")
            Text("Catch the pulse of Pakistan’s leading future-ready university.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal, Theme.pad)
                .padding(.bottom, 6)

            NewsGrid(items: MockData.news)
        }
        .background(Theme.pageBG)
        .navigationTitle("Ascend University")
        .toolbar {
            ToolbarItem(placement: .primaryPlacement) {
                Button("Apply") { apply() }
                    .buttonStyle(PrimaryCapsuleButtonStyle())
            }
        }
        .alert("Apply Online", isPresented: $showApplyToast) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Frontend-only demo. Connect the Apply flow later (web link or native form).")
        }
    }
}

struct ProgramCardRow: View {
    let programs: [ProgramCard]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 14) {
                ForEach(programs) { p in
                    NavigationLink {
                        ProgramDetailView(program: p)
                    } label: {
                        CardContainer {
                            ZStack(alignment: .bottomLeading) {
                                RemoteImage(urlString: p.imageURL)
                                    .frame(width: 260, height: 160)
                                    .clipped()

                                LinearGradient(colors: [.clear, .black.opacity(0.65)], startPoint: .top, endPoint: .bottom)

                                VStack(alignment: .leading, spacing: 6) {
                                    Text(p.title)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(p.subtitle)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.9))
                                        .lineLimit(2)
                                }
                                .padding(12)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, Theme.pad)
            .padding(.bottom, 8)
        }
    }
}

struct FacultyGrid: View {
    let items: [String]
    private let cols = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: cols, spacing: 12) {
            ForEach(items, id: \.self) { name in
                CardContainer {
                    HStack(alignment: .top, spacing: 10) {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Theme.brandPurple)
                            .frame(width: 6)

                        Text(name)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.primary)
                            .padding(.vertical, 12)

                        Spacer()
                    }
                    .padding(.horizontal, 12)
                }
            }
        }
        .padding(.horizontal, Theme.pad)
        .padding(.bottom, 10)
    }
}

struct RankingsBand: View {
    let stats: [StatCard]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ascend University Among Top Global Institutions")
                .font(.title3.weight(.bold))
                .foregroundStyle(.white)
                .padding(.horizontal, Theme.pad)
                .padding(.top, 16)

            Text("Our community of academics, students and industry partners are building a world that’s fairer, healthier and more sustainable.")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))
                .padding(.horizontal, Theme.pad)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(stats) { s in
                        CardContainer {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 10) {
                                    Image(systemName: s.systemIcon)
                                        .foregroundStyle(Theme.accentGold)
                                    Text(s.metric)
                                        .font(.title2.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                Text(s.caption)
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundStyle(.white.opacity(0.95))
                                Text(s.detail)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.85))
                            }
                            .padding(14)
                            .frame(width: 240, alignment: .leading)
                            .background(Color.white.opacity(0.08))
                        }
                    }
                }
                .padding(.horizontal, Theme.pad)
                .padding(.bottom, 16)
            }
        }
        .background(Theme.purpleBand())
        .clipShape(RoundedRectangle(cornerRadius: Theme.radius, style: .continuous))
        .padding(.horizontal, Theme.pad)
        .padding(.vertical, 10)
    }
}
