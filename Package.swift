// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AscendFrontend",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .executable(name: "AscendFrontend", targets: ["AscendFrontend"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "AscendFrontend",
            path: ".",
            exclude: ["README.md"],
            sources: [
                "App",
                "Data",
                "UI",
                "Views"
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
