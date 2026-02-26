import SwiftUI

struct AcademicsView: View {
    var body: some View {
        ScrollView {
            HeroBanner(
                title: "Academics",
                subtitle: "World-class education programs designed for tomorrow’s leaders",
                imageURL: MockData.heroCampus
            )

            SectionTitle(title: "Our Programs")
            ProgramList(programs: MockData.programs)

            SectionTitle(title: "Find Programs by Faculty")
            FacultyProgramList(groups: MockData.facultyGroups)
        }
        .background(Theme.pageBG)
        .navigationTitle("Academics")
        .navigationInline()
        .toolbar {
            ToolbarItem(placement: .primaryPlacement) {
                Button("Apply") {}
                    .buttonStyle(PrimaryCapsuleButtonStyle())
            }
        }
    }
}

struct ProgramList: View {
    let programs: [ProgramCard]

    var body: some View {
        VStack(spacing: 14) {
            ForEach(programs) { p in
                NavigationLink {
                    ProgramDetailView(program: p)
                } label: {
                    CardContainer {
                        HStack(spacing: 12) {
                            RemoteImage(urlString: p.imageURL)
                                .frame(width: 92, height: 72)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                .padding(12)

                            VStack(alignment: .leading, spacing: 6) {
                                Text(p.title)
                                    .font(.headline)
                                    .foregroundStyle(.primary)
                                Text(p.subtitle)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(3)
                            }
                            .padding(.vertical, 12)

                            Spacer()
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, Theme.pad)
        .padding(.bottom, 10)
    }
}

struct FacultyProgramList: View {
    let groups: [FacultyGroup]

    var body: some View {
        VStack(spacing: 12) {
            ForEach(groups) { g in
                CardContainer {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(g.faculty)
                            .font(.headline)
                            .padding(.top, 12)

                        VStack(alignment: .leading, spacing: 6) {
                            ForEach(g.programs, id: \.self) { p in
                                HStack(spacing: 8) {
                                    Circle().fill(Theme.brandPurple).frame(width: 6, height: 6)
                                    Text(p)
                                        .font(.subheadline)
                                        .foregroundStyle(.primary)
                                }
                            }
                        }
                        .padding(.bottom, 12)
                    }
                    .padding(.horizontal, 12)
                }
            }
        }
        .padding(.horizontal, Theme.pad)
        .padding(.bottom, 20)
    }
}

struct ProgramDetailView: View {
    let program: ProgramCard

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                ZStack(alignment: .bottomLeading) {
                    RemoteImage(urlString: program.imageURL)
                        .frame(height: 220)
                        .clipped()

                    LinearGradient(colors: [.clear, .black.opacity(0.65)], startPoint: .top, endPoint: .bottom)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(program.title)
                            .font(.title.weight(.bold))
                            .foregroundStyle(.white)
                        Text(program.subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .padding(16)
                }
                .clipShape(RoundedRectangle(cornerRadius: Theme.radius, style: .continuous))
                .padding(.horizontal, Theme.pad)
                .padding(.top, 10)

                Text(program.details)
                    .padding(.horizontal, Theme.pad)

                Spacer(minLength: 24)
            }
        }
        .background(Theme.pageBG)
        .navigationTitle("Program")
        .navigationInline()
    }
}
