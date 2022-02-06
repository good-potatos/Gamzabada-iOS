// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Effects",
    platforms: [
        .iOS(.v15), .macOS(.v12),
    ],
    products: [
        .library(name: "Effects", targets: ["Effects"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            .upToNextMajor(from: "0.33.0")
        ),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.0"),
        .package(name: "Entity", path: "../Entity"),
    ],
    targets: [
        .target(
            name: "Effects",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SwiftFormat", package: "SwiftFormat"),
                .product(name: "Entity", package: "Entity"),
            ]
        ),
        .testTarget(
            name: "EffectsTests",
            dependencies: ["Effects"]
        ),
    ]
)
