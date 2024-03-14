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
    ],
    targets: [
        .target(
            name: "SoftColor",
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
