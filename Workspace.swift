//
//  Workspace.swift
//  Zipthing-iOSManifests
//
//  Created by Yujin Kim on 2023-12-20.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ConfigurationPlugin
import EnvironmentPlugin


let workspace = Workspace(
    name: "Zipthing",
    projects: [
        Root.allCases.map(\.path),
        Features.allCases.map(\.path),
        Shared.allCases.map(\.path)
    ].flatMap { $0 },
    schemes: [],
    fileHeaderTemplate: nil,
    additionalFiles: [],
    generationOptions: .options()
 )
