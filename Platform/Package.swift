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
//        .package(url: "https://github.com/good-potatos/GamzaFoundation", .upToNextMajor(from: "1.0.0")),
        // MARK: TODO: 현재 master branch에는 관련 dependency가 없어서 sub branch를 이용. master merge 이후에 변경 필요
        .package(url: "https://github.com/good-potatos/GamzaFoundation", .branch("feature/architecture")),
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: [
                .product(name: "GamzaFoundation", package: "GamzaFoundation"),
            ]
        ),

        .target(
            name: "PropertyWrappers",
            dependencies: [
                .product(name: "GamzaFoundation", package: "GamzaFoundation"),
            ]
        ),
    ]
)
