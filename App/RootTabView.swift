import SwiftUI

enum AppTab: Hashable {
    case home, academics, news, hub, more
}

struct RootTabView: View {
    @State private var tab: AppTab = .home

    var body: some View {
        TabView(selection: $tab) {
            NavigationStack { HomeView() }
                .tabItem { Label("Home", systemImage: "house.fill") }
                .tag(AppTab.home)

            NavigationStack { AcademicsView() }
                .tabItem { Label("Academics", systemImage: "graduationcap.fill") }
                .tag(AppTab.academics)

            NavigationStack { NewsView() }
                .tabItem { Label("News", systemImage: "newspaper.fill") }
                .tag(AppTab.news)

            NavigationStack { StudentHubView() }
                .tabItem { Label("Hub", systemImage: "square.grid.2x2.fill") }
                .tag(AppTab.hub)

            NavigationStack { MoreView() }
                .tabItem { Label("More", systemImage: "ellipsis") }
                .tag(AppTab.more)
        }
        .tint(Theme.brandPurple)
    }
}
