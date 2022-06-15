// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProxyModule",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "ProxyModule",
            targets: ["ProxyModule"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            .upToNextMajor(from: "0.36.0")
        ),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.7"),
        .package(url: "https://github.com/CombineCommunity/CombineExt.git", from: "1.0.0"),
        .package(url: "https://github.com/FLEXTool/FLEX.git", from: "4.3.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.9.0"),

    ],
    targets: [
        .target(
            name: "ProxyModule",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "FLEX", package: "FLEX"),
                .product(name: "CombineExt", package: "CombineExt"),
                .product(name: "SwiftyBeaver", package: "SwiftyBeaver"),
            ]
        ),
        .testTarget(
            name: "ProxyModuleTests",
            dependencies: ["ProxyModule"]
        ),
    ]
)
