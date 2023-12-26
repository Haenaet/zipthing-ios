//
//  Config.swift
//  Tuist
//
//  Edited by Yujin Kim on 2023/12/19.
//

import ProjectDescription

let config = Config(
    compatibleXcodeVersions: [
        "14.3.1",
        "15.1"
    ],
    cloud: .cloud(projectId: ""),
    swiftVersion: "5.9",
    plugins: [
        .local(path: .relativeToManifest("../../Plugins/DependencyPlugin")),
        .local(path: .relativeToManifest("../../Plugins/EnvironmentPlugin"))
    ],
    generationOptions: .options()
)
