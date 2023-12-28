//
//  Project.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2023-12-25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ConfigurationPlugin
import DependencyPlugin

let project = Project.makeModule(
    name: Shared.designSystem.name,
    targets: [.demo, .framework],
    packages: [],
    internalDependencies: [],
    externalDependencies: [],
    hasResources: true
)
