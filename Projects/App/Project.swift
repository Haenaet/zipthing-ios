//
//  Project.swift
//  App
//
//  Created by 박성원 on 2023-12-04.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ConfigurationPlugin

let project = Project.makeModule(
    name: Root.app.name,
    targets: [.app, .uiTests, .unitTests],
    packages: [],
    internalDependencies: Features.allCases.map(\.project),
    externalDependencies: [],
    hasResources: true
)
