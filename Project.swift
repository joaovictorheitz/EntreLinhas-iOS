import ProjectDescription

let project = Project(
    name: "EntreLinhasIOS",
    options: Project
        .Options
        .options(developmentRegion: "pt-BR"),
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
            dependencies: [.external(name: "Supabase")]
        ),
        .target(
            name: "EntreLinhasIOSTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.EntreLinhasIOSTests",
            infoPlist: .default,
            sources: ["EntreLinhasIOS/Tests/**"],
            resources: [],
            dependencies: []
        ),
    ]
)
