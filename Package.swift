// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SoftColor",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SoftColor",
            targets: ["SoftColor"]
        ),
        .library(
            name: "SoftColorAnalyzer",
            targets: ["SoftColorAnalyzer"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/XCGLogger/XCGLogger", from: "6.1.0"),
    ],
    targets: [
        .target(
            name: "SoftColor",
            dependencies: ["SoftColorAnalyzer"],
            path: "Sources/SoftColor",
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "SoftColorAnalyzer",
            dependencies: ["XCGLogger"],
            path: "Sources/SoftColorAnalyzer"
        ),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
