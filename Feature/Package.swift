// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "Feature",
            targets: ["Feature"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "Feature",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
            ]
        ),
    ]
)
