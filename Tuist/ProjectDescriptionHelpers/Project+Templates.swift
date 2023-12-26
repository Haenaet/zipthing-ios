//
//  Project+Templates.swift
//  ProjectDescriptionHelpers
//
//  Edited by Yujin Kim on 2023/12/19.
//

import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin

public extension Project {
    static func makeTarget(
        name: String,
        destinations: ProjectDescription.Destinations,
        product: ProjectDescription.Product,
        bundleId: String,
        deploymentTargets: ProjectDescription.DeploymentTargets,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = nil,
        resources: ResourceFileElements? = nil,
        dependencies: [ProjectDescription.TargetDependency] = []
    ) -> Target {
        return Target(
            name: name,
            destinations: destinations,
            product: product,
            bundleId: bundleId,
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
    }
    
    static func makeModule(
        name: String,
        target: TargetDependency.Root,
        infoPlist: InfoPlist = .default,
        packages: [ProjectDescription.Package] = []
    ) -> Project {
        let bundleId = Environment.bundleIdentifier
        let deploymentTargets = Environment.deploymentTarget
        
        var targets: [Target] = []
        
        // MARK: - App
        
        if target == .app {
            targets.append(
                makeTarget(
                    name: name,
                    destinations: [.iPhone],
                    product: .app,
                    bundleId: "\(bundleId)",
                    deploymentTargets: deploymentTargets,
                    sources: ["Sources/**"],
                    resources: [],
                    dependencies: []
                )
            )
        }
        
        // MARK: - Domain
        
        if target == .domain {
            targets.append(
                makeTarget(
                    name: name,
                    destinations: [.iPhone],
                    product: .framework,
                    bundleId: "\(bundleId)",
                    deploymentTargets: deploymentTargets,
                    sources: ["Sources/**"],
                    resources: [],
                    dependencies: []
                )
            )
        }
        
        // MARK: - ThirdParty
        
        if target == .thirdparty {
            targets.append(
                makeTarget(
                    name: name,
                    destinations: [.iPhone],
                    product: .framework,
                    bundleId: "\(bundleId)",
                    deploymentTargets: deploymentTargets,
                    sources: ["Sources/**"],
                    resources: [],
                    dependencies: []
                )
            )
        }
        
        return Project(
            name: name,
            organizationName: Environment.workspaceName,
            options: .options(),
            packages: [],
            settings: nil,
            targets: targets,
            schemes: [],
            fileHeaderTemplate: nil,
            additionalFiles: [],
            resourceSynthesizers: []
        )
    }
}
