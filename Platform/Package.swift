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
        .package(path: "../ProxyModule"),
        .package(url: "https://github.com/good-potatos/GamzaFoundation-iOS", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: [
                .product(name: "ProxyModule", package: "ProxyModule"),
                .product(name: "GamzaFoundation-iOS", package: "GamzaFoundation-iOS"),
            ]
        ),

        .target(
            name: "PropertyWrappers",
            dependencies: [
                .product(name: "ProxyModule", package: "ProxyModule"),
            ]
        ),
    ]
)
