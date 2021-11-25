import ProjectDescription

let project = Project(
    name: "SNS",
    organizationName: "com.AppSoulte",
    targets: [
        Target(
            name: "SNS",
            platform: .iOS,
            product: .app,
            bundleId: "com.AppSoulte",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
            infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
            sources: ["Sources/**"],
            resources: [
                "Resources/**"
            ]
        )
    ]
)
