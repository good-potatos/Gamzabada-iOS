// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GDS",
    platforms: [
        .iOS(.v15), .macOS(.v12),
    ],
    products: [
        .library(
            name: "GDS",
            targets: ["GDS"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GDS",
            dependencies: []
        ),
        .testTarget(
            name: "GDSTests",
            dependencies: ["GDS"]
        ),
    ]
)
