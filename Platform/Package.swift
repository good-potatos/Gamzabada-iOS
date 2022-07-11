// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Platform",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "Network",
            targets: ["Network"]
        ),

        .library(
            name: "PropertyWrappers",
            targets: ["PropertyWrappers"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/good-potatos/GamzaFoundation", .upToNextMajor(from: "1.1.0")),
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: [
                .product(name: "GamzaFoundation", package: "GamzaFoundation"),
            ]
        ),

        .target(
            name: "PropertyWrappers",
            dependencies: [
                .product(name: "GamzaFoundation", package: "GamzaFoundation"),
            ]
        ),
    ]
)
