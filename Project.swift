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
            sources: ["EntreLinhasIOS/Sources/**", "EntreLinhasIOS/Config/**"],
            resources: ["EntreLinhasIOS/Resources/**", "EntreLinhasIOS/Config/Config.plist"],
            dependencies: [.external(name: "Supabase"), .external(name: "CustomTextField")]
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
