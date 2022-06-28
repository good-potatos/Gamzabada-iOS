// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProxyDebugModule",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "ProxyDebugModule",
            targets: ["ProxyDebugModule"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.7"),
        .package(url: "https://github.com/FLEXTool/FLEX.git", from: "4.3.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.9.0"),
    ],
    targets: [
        .target(
            name: "ProxyDebugModule",
            dependencies: [
                .product(name: "FLEX", package: "FLEX"),
                .product(name: "SwiftyBeaver", package: "SwiftyBeaver"),
            ]
        ),
        .testTarget(
            name: "ProxyDebugModuleTests",
            dependencies: ["ProxyDebugModule"]
        ),
    ]
)
