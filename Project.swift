import ProjectDescription

let project = Project(
    name: "EntreLinhasIOS",
    targets: [
        .target(
            name: "EntreLinhasIOS",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.EntreLinhasIOS",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["EntreLinhasIOS/Sources/**"],
            resources: ["EntreLinhasIOS/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "EntreLinhasIOSTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.EntreLinhasIOSTests",
            infoPlist: .default,
            sources: ["EntreLinhasIOS/Tests/**"],
            resources: [],
            dependencies: [.target(name: "EntreLinhasIOS")]
        ),
    ]
)
