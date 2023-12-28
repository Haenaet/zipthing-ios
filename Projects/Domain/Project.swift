//
//  Project.swift
//  Domain
//
//  Created by 박성원 on 2023-12-04.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ConfigurationPlugin

let project = Project.makeModule(
    name: Root.domain.name,
    targets: [.unitTests, .framework],
    internalDependencies: Shared.allCases.map(\.project),
    externalDependencies: []
)
