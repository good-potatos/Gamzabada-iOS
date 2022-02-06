// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProxyModule",
    platforms: [
        .iOS(.v15), .macOS(.v12),
    ],
    products: [
        .library(
            name: "ProxyModule",
            type: .dynamic,
            targets: ["ProxyModule"]
        ),
    ],
    dependencies: [
        .package(name: "Effects", path: "../Effects"),
        .package(name: "GDS", path: "../GDS"),
    ],
    targets: [
        .target(
            name: "ProxyModule",
            dependencies: [
                .product(name: "Effects", package: "Effects"),
                .product(name: "GDS", package: "GDS"),
            ]
        ),
        .testTarget(
            name: "ProxyModuleTests",
            dependencies: ["ProxyModule"]
        ),
    ]
)
