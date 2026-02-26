import Foundation

// Content and image URLs discovered from the published Lovable site.
// Site: https://modern-campus-canvas.lovable.app [Source](https://modern-campus-canvas.lovable.app)

enum MockData {

    // MARK: Image URLs (from resource discovery)
    // hero/program/news assets
    static let heroCampus = "https://modern-campus-canvas.lovable.app/assets/hero-campus-0MDcnAxg.png"
    static let heroStudents = "https://modern-campus-canvas.lovable.app/assets/hero-students-DOuHlVqj.png"
    static let heroGraduation = "https://modern-campus-canvas.lovable.app/assets/hero-graduation-CzErl8UT.png"

    static let programUndergrad = "https://modern-campus-canvas.lovable.app/assets/program-undergrad-BfR_9z7-.png"
    static let programPostgrad = "https://modern-campus-canvas.lovable.app/assets/program-postgrad-DaXTig0V.png"
    static let programADP = "https://modern-campus-canvas.lovable.app/assets/program-adp-DuaOGmad.png"

    static let news1 = "https://modern-campus-canvas.lovable.app/assets/news-1-VIx8W1Yb.png"
    static let news2 = "https://modern-campus-canvas.lovable.app/assets/news-2-Ch6emtaq.png"
    static let news3 = "https://modern-campus-canvas.lovable.app/assets/news-3-DPq4_QBD.png"

    // MARK: Home hero slides
    static func heroSlides(applyAction: @escaping () -> Void) -> [HeroSlide] {
        [
            .init(
                title: "Admissions Open Spring 2026",
                subtitle: "Pakistan’s Leading Future-Ready University — Rise Beyond",
                cta: "Apply Now",
                imageURL: heroCampus,
                onTap: applyAction
            ),
            .init(
                title: "Guarantees Your Employability",
                subtitle: "Our 3U1M® Program combines education with market experience",
                cta: "Explore",
                imageURL: heroStudents,
                onTap: {}
            ),
            .init(
                title: "Convocation 2026",
                subtitle: "Celebrating Excellence and Achievement",
                cta: "Learn More",
                imageURL: heroGraduation,
                onTap: {}
            )
        ]
    }

    // MARK: Programs (Study with us / Academics)
    static let programs: [ProgramCard] = [
        .init(
            title: "Undergraduate Programs",
            subtitle: "Comprehensive bachelor’s degree programs across multiple disciplines.",
            imageURL: programUndergrad,
            details: "Explore admissions requirements, departments, and program outcomes."
        ),
        .init(
            title: "Postgraduate Programs",
            subtitle: "Advanced master’s and doctoral programs for research and specialization.",
            imageURL: programPostgrad,
            details: "Explore research areas, scholarships, and application timelines."
        ),
        .init(
            title: "Associate Degree Programs (ADP)",
            subtitle: "Two-year programs providing practical skills for immediate career entry.",
            imageURL: programADP,
            details: "Explore applied curriculum, internships, and pathways to bachelor’s degrees."
        )
    ]

    // MARK: Faculties (home list)
    static let faculties: [String] = [
        "Faculty of Business and Management Sciences",
        "Faculty of Economics and Commerce",
        "Faculty of Computer Science and IT",
        "Faculty of Social Sciences",
        "Faculty of Allied Health Sciences",
        "Faculty of Art and Design",
        "Faculty of Pharmacy",
        "Faculty of Medical Sciences",
        "Faculty of Engineering and Technology",
        "Faculty of Law"
    ]

    // MARK: Rankings band
    static let stats: [StatCard] = [
        .init(metric: "TOP 301–400", caption: "Times Higher Education World Ranking", detail: "Among top universities of Pakistan", systemIcon: "trophy"),
        .init(metric: "130+", caption: "Countries Represented", detail: "A truly diverse community", systemIcon: "globe"),
        .init(metric: "TOP 101–200", caption: "Quality of Education Globally", detail: "Times Higher Education Impact", systemIcon: "checkmark.seal"),
        .init(metric: "1st", caption: "Partner of Babson College (USA)", detail: "From Pakistan", systemIcon: "star"),
    ]

    // MARK: Latest News & Events
    static let news: [NewsItem] = [
        .init(category: "Events", title: "International Students Welcome Week Celebrates Global Diversity", dateText: "Feb 24, 2026", imageURL: news1, body: "Placeholder article body."),
        .init(category: "Sports", title: "Ascend University Cricket Team Clinches Championship Title", dateText: "Feb 20, 2026", imageURL: news2, body: "Placeholder article body."),
        .init(category: "Academics", title: "Transformational Reflection Session on Character and Leadership", dateText: "Feb 18, 2026", imageURL: news3, body: "Placeholder article body.")
    ]

    // MARK: Academics - Find Programs by Faculty
    static let facultyGroups: [FacultyGroup] = [
        .init(faculty: "Engineering & Technology", programs: ["B.Sc Electrical Engineering", "B.Sc Mechanical Engineering", "B.Sc Civil Engineering"]),
        .init(faculty: "Business & Management", programs: ["BS Culinary Arts Management", "BS Aviation Management", "BBA (Hons.)"]),
        .init(faculty: "Medical Sciences", programs: ["MBBS", "BDS", "Bachelor of Eastern Medicine"]),
        .init(faculty: "Computer Science & IT", programs: ["BS Computer Science", "BS Software Engineering", "BS Data Science"]),
        .init(faculty: "Social Sciences", programs: ["BS Psychology", "BS Mass Communication", "BS Education"]),
        .init(faculty: "Art & Design", programs: ["BFA Fine Arts", "BS Graphic Design", "BS Interior Design"])
    ]

    // MARK: Student Hub
    static let hubFeatures: [HubFeature] = [
        .init(title: "Student Portal", subtitle: "Access your grades, timetable, assignments, and university resources all in one place.", systemIcon: "person.crop.circle.badge.checkmark", details: "Placeholder details: integrate real portal modules later."),
        .init(title: "Clubs & Societies", subtitle: "Join 40+ student clubs ranging from debate, drama, sports, to tech and entrepreneurship.", systemIcon: "person.3", details: "Placeholder details: club directory, memberships, and events."),
        .init(title: "Career Services", subtitle: "Career counseling, job placement, internship matching, and resume building workshops.", systemIcon: "briefcase", details: "Placeholder details: appointment booking and job board."),
        .init(title: "Student Support", subtitle: "Counseling, wellness programs, financial aid guidance, and academic advising.", systemIcon: "heart.text.square", details: "Placeholder details: contact options and support resources."),
        .init(title: "Library", subtitle: "State-of-the-art library with 100,000+ books, digital resources, and research databases.", systemIcon: "books.vertical", details: "Placeholder details: catalog search and opening hours.")
    ]

    // MARK: Alumni
    static let alumniPillars: [AlumniPillar] = [
        .init(title: "Alumni Network", subtitle: "Join 50,000+ alumni worldwide and expand your professional network.", systemIcon: "person.3"),
        .init(title: "Success Stories", subtitle: "Discover how our graduates are making an impact across industries.", systemIcon: "star"),
        .init(title: "Alumni Events", subtitle: "Reunions, networking events, and homecoming celebrations.", systemIcon: "calendar"),
        .init(title: "Give Back", subtitle: "Support the next generation through mentorship and donations.", systemIcon: "heart"),
    ]

    // MARK: About Us
    static let aboutStory: [String] = [
        "Ascend University, established in 1991, is Pakistan’s leading future-ready university. With a strong emphasis on innovation, research, and industry collaboration, we have consistently been ranked among the top universities in Pakistan.",
        "Our unique 3U1M® Program guarantees employability by combining three years of university education with one year of market experience, ensuring our graduates are industry-ready from day one.",
        "Recognized by the Times Higher Education World University Rankings among the Top 301-400 globally, we continue to push boundaries in education, research, and community impact."
    ]

    static let values: [ValueCard] = [
        .init(title: "Vision", body: "To be recognized as a world-class university that leads in entrepreneurial education, research, and innovation.", systemIcon: "eye"),
        .init(title: "Mission", body: "To provide quality education, foster research excellence, and produce ethical leaders and entrepreneurs who contribute to society.", systemIcon: "target"),
        .init(title: "Core Values", body: "Innovation, Integrity, Inclusivity, Excellence, and Social Responsibility guide everything we do.", systemIcon: "seal"),
        .init(title: "Heritage", body: "Founded in 1991, Ascend University has grown from a single campus to a nationally and internationally recognized institution.", systemIcon: "building.columns")
    ]

    static let leadershipIntro = "Under the visionary leadership of our Chancellor and a dedicated team of academic leaders, Ascend University continues to achieve new heights of academic and research excellence."

    static let leaders: [LeaderCard] = [
        .init(role: "Chancellor", org: "Ascend University"),
        .init(role: "Vice Chancellor", org: "Ascend University"),
        .init(role: "Pro Vice Chancellor", org: "Ascend University")
    ]
}
