import Foundation

// MARK: - Core Models (Frontend-only)

struct HeroSlide: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let cta: String
    let imageURL: String
    let onTap: () -> Void
}

struct ProgramCard: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageURL: String
    let details: String
}

struct FacultyGroup: Identifiable {
    let id = UUID()
    let faculty: String
    let programs: [String]
}

struct StatCard: Identifiable {
    let id = UUID()
    let metric: String
    let caption: String
    let detail: String
    let systemIcon: String
}

struct NewsItem: Identifiable {
    let id = UUID()
    let category: String
    let title: String
    let dateText: String
    let imageURL: String
    let body: String
}

struct HubFeature: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemIcon: String
    let details: String
}

struct AlumniPillar: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemIcon: String
}

struct ValueCard: Identifiable {
    let id = UUID()
    let title: String
    let body: String
    let systemIcon: String
}

struct LeaderCard: Identifiable {
    let id = UUID()
    let role: String
    let org: String
}
