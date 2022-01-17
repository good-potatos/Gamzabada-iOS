// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Login",
    platforms: [
        .iOS(.v15), .macOS(.v12)
    ],
    products: [
        .library(
            name: "Login",
            targets: ["Login"]),
    ],
    dependencies: [
        .package(name: "ProxyModule", path: "../ProxyModule")
    ],
    targets: [
        .target(
            name: "Login",
            dependencies: []),
        .testTarget(
            name: "LoginTests",
            dependencies: ["Login"]),
    ]
)
