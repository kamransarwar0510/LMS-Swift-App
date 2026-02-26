import SwiftUI

struct MoreView: View {
    var body: some View {
        List {
            Section("Explore") {
                NavigationLink("About Us") { AboutView() }
                NavigationLink("Alumni") { AlumniView() }
            }

            Section("Contact Us") {
                LabeledContent("Address", value: "1 University Avenue, Lahore, Pakistan")
                LabeledContent("Phone", value: "+92 42 111-272-363")
                LabeledContent("Email", value: "info@ascend.edu.pk")
            }

            Section("Quick Links") {
                NavigationLink("Get in Touch") { Text("Placeholder") }
                NavigationLink("Careers") { Text("Placeholder") }
                NavigationLink("Fee Structure") { Text("Placeholder") }
                NavigationLink("Scholarships") { Text("Placeholder") }
            }

            Section("Legal") {
                NavigationLink("Privacy Policy") { LegalPlaceholderView(title: "Privacy Policy") }
                NavigationLink("Terms of Use") { LegalPlaceholderView(title: "Terms of Use") }
            }
        }
        .navigationTitle("More")
    }
}

private struct LegalPlaceholderView: View {
    let title: String
    var body: some View {
        ScrollView {
            Text("Placeholder \(title). Replace with real content later.")
                .padding(Theme.pad)
        }
        .background(Theme.pageBG)
        .navigationTitle(title)
        .navigationInline()
    }
}
