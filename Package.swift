// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MangaDex",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "MangaDex",
            targets: ["MangaDex"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MangaDex",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "MangaDexTests",
            dependencies: ["MangaDex"]),
    ]
)
