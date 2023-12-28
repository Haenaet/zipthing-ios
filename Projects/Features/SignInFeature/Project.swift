//
//  Project.swift
//  SignInFeature
//
//  Created by Yujin Kim on 2023-12-25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ConfigurationPlugin

let project = Project.makeModule(
    name: Features.signin.name,
    targets: [.demo, .uiTests, .unitTests, .staticFramework],
    internalDependencies: [
        Root.domain.project,
        Shared.designSystem.project,
        Shared.thirdParty.project
    ],
    externalDependencies: []
)
