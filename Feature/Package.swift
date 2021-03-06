// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "MainTab",
            targets: ["MainTab"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(url: "https://github.com/good-potatos/GamzaUIKit", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "MainTab",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
                .product(name: "GamzaUIKit", package: "GamzaUIKit"),
            ]
        ),
    ]
)
