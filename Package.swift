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
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.6.4")
        )
    ],
    targets: [
        .target(
            name: "MangaDex",
            dependencies: ["Alamofire"],
            path: "Sources"
        ),
        .testTarget(
            name: "MangaDexTests",
            dependencies: ["MangaDex"]),
    ]
)
