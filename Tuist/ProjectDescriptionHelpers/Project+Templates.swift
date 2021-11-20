import ProjectDescription

extension Project {
    public static func app() -> Project {
        let targets = makeAppTargets(name: "Servicename", dependencies: [])
        let schemes = makeSchemes(name: "Servicename")

        return Project(name: "Servicename",
                       organizationName: "nalongenter.com",
                       settings: .settings(configurations: [
                           .debug(name: "DEBUG", xcconfig: "Configurations/DEBUG.xcconfig"),
                           .release(name: "RELEASE", xcconfig: "Configurations/RELEASE.xcconfig"),
                       ]),
                       targets: targets,
                       schemes: schemes)
    }

    private static func makeAppTargets(
        name: String,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
        ]

        let mainTarget = Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: "com.nalongenter.\(name)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**",
                        "Targets/\(name)/Resources/Images.xcassets/**"],
            scripts: makeScripts(),
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.nalongenter.\(name)Tests",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)"),
            ]
        )
        return [mainTarget, testTarget]
    }

    private static func makeSchemes(name: String) -> [Scheme] {
        return [
            Scheme(
                name: "\(name)-Debug",
                shared: true,
                buildAction: BuildAction(targets: ["\(name)"]),
                runAction: .runAction(configuration: "DEBUG"),
                archiveAction: .archiveAction(configuration: "DEBUG"),
                profileAction: .profileAction(configuration: "DEBUG"),
                analyzeAction: .analyzeAction(configuration: "DEBUG")
            ),
            Scheme(
                name: "\(name)",
                shared: true,
                buildAction: BuildAction(targets: ["\(name)"]),
                runAction: .runAction(configuration: "RELEASE"),
                archiveAction: .archiveAction(configuration: "RELEASE"),
                profileAction: .profileAction(configuration: "RELEASE"),
                analyzeAction: .analyzeAction(configuration: "RELEASE")
            ),
        ]
    }

    private static func makeScripts() -> [TargetScript] {
        return [
            .pre(
                script: "./Pods/SwiftFormat/CommandLineTool/swiftformat .",
                name: "Run Script"
            ),
        ]
    }
}
