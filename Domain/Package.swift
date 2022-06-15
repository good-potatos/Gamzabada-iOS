// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
    ],
    dependencies: [
        .package(path: "../Platform"),
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Network", package: "Platform"),
                .product(name: "GamzaFoundation", package: "Platform"),
                .product(name: "GamzaUIKit", package: "Platform"),
                .product(name: "PropertyWrappers", package: "Platform"),
            ]
        ),
    ]
)
