//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박성원 on 2023-12-04.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: TargetDependency.Root.thirdparty.name,
    target: TargetDependency.Root.thirdparty
)
