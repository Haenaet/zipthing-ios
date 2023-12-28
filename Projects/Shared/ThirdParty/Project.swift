//
//  Project.swift
//  ThirdParty
//
//  Created by Yujin Kim on 2023-12-25.
//

import ProjectDescription
import ProjectDescriptionHelpers
import ConfigurationPlugin
import DependencyPlugin

let project = Project.makeModule(
    name: Shared.thirdParty.name,
    targets: [.framework],
    packages: [],
    internalDependencies: [],
    externalDependencies: [
        TargetDependency.Alamofire,
        TargetDependency.IQKeyboardManagerSwift,
        TargetDependency.SnapKit
    ]
)
