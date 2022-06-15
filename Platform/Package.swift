// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Platform",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "GamzaFoundation",
            targets: ["GamzaFoundation"]
        ),

        .library(
            name: "GamzaUIKit",
            targets: ["GamzaUIKit"]
        ),

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
    ],
    targets: [
        .target(
            name: "GamzaFoundation",
            dependencies: [
                .product(name: "ProxyModule", package: "ProxyModule"),
            ]
        ),

        .target(
            name: "GamzaUIKit",
            dependencies: [
                .product(name: "ProxyModule", package: "ProxyModule"),
            ]
        ),

        .target(
            name: "Network",
            dependencies: [
                .product(name: "ProxyModule", package: "ProxyModule"),
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
