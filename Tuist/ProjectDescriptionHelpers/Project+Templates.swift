//
//  Project+Templates.swift
//  ProjectDescriptionHelpers
//
//  Edited by Yujin Kim on 2023/12/19.
//

import Foundation
import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin

public extension Project {
    /// 프로젝트 타겟을 생성하는 메서드
    /// - Parameters:
    ///   - name: 타겟 이름
    ///   - destinations: 타겟이 지원하는 대상
    ///   - product: 타겟 빌드 유형 설정
    ///   - productName: 타겟 빌드 이름으로 nil일 경우 타겟 이름과 동일하게 설정
    ///   - bundleId: 식별자 설정
    ///   - deploymentTargets: 타겟이 지원하는 최소 배포 대상 설정
    ///   - infoPlist: Info.plist 파일 구성
    ///   - sources: 타겟의 원천 파일 구성
    ///   - resources: 타겟의 리소스 파일 구성
    ///   - copyfiles: 빌드 시 복사할 작업 또는 파일을 구성할 때 사용
    ///   - headers: 타겟의 설명을 추가할 때 사용
    ///   - entitlements: 타겟의 권한 파일을 추가할 때 사용
    ///   - scripts: 빌드 스크립트를 추가할 때 사용
    ///   - dependencies: 타겟의 종속성을 추가할 때 사용
    ///   - settings: 타겟의 설정을 구성할 때 사용
    ///   - coreDataModels: Core Data 모델 파일을 구성할 때 사용
    ///   - environmentVariables: 환경 변수 추가할 때 사용
    ///   - launchArguments: 타겟 실행 시 추가할 별도의 인자를
    ///   - additionalFiles: 자동으로 추가되지 않는 파일을 Xcode에 추가할 때 사용
    ///   - buildRules: 타겟을 컴파일 할 때 원천 파일을 변환하는 규칙을 추가할 때 사용
    /// - Returns: ProjectDescription.Target
    static func makeTarget(
        name: String,
        destinations: ProjectDescription.Destinations,
        product: ProjectDescription.Product,
        productName: String? = nil,
        bundleId: String,
        deploymentTargets: ProjectDescription.DeploymentTargets? = nil,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = nil,
        resources: ResourceFileElements? = nil,
        copyfiles: [ProjectDescription.CopyFilesAction]? = nil,
        headers: ProjectDescription.Headers? = nil,
        entitlements: ProjectDescription.Entitlements? = nil,
        scripts: [ProjectDescription.TargetScript] = [],
        dependencies: [ProjectDescription.TargetDependency] = [],
        settings: ProjectDescription.Settings? = nil,
        coreDataModels: [ProjectDescription.CoreDataModel] = [],
        environmentVariables: [String : ProjectDescription.EnvironmentVariable] = [:],
        launchArguments: [ProjectDescription.LaunchArgument] = [],
        additionalFiles: [ProjectDescription.FileElement] = [],
        buildRules: [ProjectDescription.BuildRule] = []
    ) -> Target {
        return Target(
            name: name,
            destinations: destinations,
            product: product,
            productName: productName,
            bundleId: bundleId,
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            copyFiles: copyfiles,
            headers: headers,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings,
            coreDataModels: coreDataModels,
            environmentVariables: environmentVariables,
            launchArguments: launchArguments,
            additionalFiles: additionalFiles,
            buildRules: buildRules
        )
    }
    
    /// 모듈을 생성하는 메서드
    /// - Parameters:
    ///   - name: 모듈의 이름
    ///   - targets: 모듈에 포함할 타겟
    ///   - infoPlist: Info.plist 파일 구성
    ///   - packages: 패키지
    ///   - internalDependencies: 모듈 의존성
    ///   - externalDependencies: 외부 패키지 의존성
    ///   - hasResources: 리소스 파일 존재 여부
    /// - Returns: ProjectDescription.Project
    static func makeModule(
        name: String,
        targets: Set<ModuleTarget> = Set([.demo, .uiTests, .unitTests]),
        infoPlist: InfoPlist = .default,
        packages: [ProjectDescription.Package] = [],
        internalDependencies: [TargetDependency] = [],
        externalDependencies: [TargetDependency] = [],
        hasResources: Bool = false
    ) -> Project {
        let baseSettings = SettingsDictionary.baseSettings
        let bundleIdentifierPrefix = Environment.bundleIdentifierPrefix
        let destinations = Environment.destinations
        let organizationName = Environment.workspaceName
        let platform = Environment.platform
        let deploymentTargets = Environment.deploymentTargets
        var projectTargets: [Target] = []
        
        // MARK: - App
        
        if targets.contains(.app) {
            projectTargets.append(
                makeTarget(
                    name: name,
                    destinations: destinations,
                    product: .app,
                    bundleId: "\(bundleIdentifierPrefix)",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .extendingDefault(with: Project.infoPlist),
                    sources: ["Sources/**"],
                    resources: [.glob(pattern: "Resources/**", excluding: [])],
                    dependencies: [
                        internalDependencies,
                        externalDependencies
                    ].flatMap { $0 },
                    settings: .settings(base: baseSettings, configurations: [])
                )
            )
        }
        
        // MARK: - Dynamic Framework
        
        if targets.contains(.framework) {
            projectTargets.append(
                makeTarget(
                    name: name,
                    destinations: destinations,
                    product: .framework,
                    bundleId: "\(bundleIdentifierPrefix).\(name)",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    resources: hasResources ? [.glob(pattern: "Resources/**", excluding: [])] : [],
                    dependencies: [
                        internalDependencies,
                        externalDependencies
                    ].flatMap { $0 },
                    settings: .settings(base: baseSettings, configurations: [])
                )
            )
        }
        
        // MARK: - Static Framework
        
        if targets.contains(.framework) {
            projectTargets.append(
                makeTarget(
                    name: name,
                    destinations: destinations,
                    product: .staticFramework,
                    bundleId: "\(bundleIdentifierPrefix).\(name)",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    resources: hasResources ? [.glob(pattern: "Resources/**", excluding: [])] : [],
                    dependencies: [
                        internalDependencies,
                        externalDependencies
                    ].flatMap { $0 },
                    settings: .settings(base: baseSettings, configurations: [])
                )
            )
        }
        
        // MARK: - Demo
        
        if targets.contains(.demo) {
            projectTargets.append(
                makeTarget(
                    name: "\(name)Demo",
                    destinations: destinations,
                    product: .app,
                    bundleId: "\(bundleIdentifierPrefix).\(name)Demo",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .default,
                    sources: ["Demo/Sources/**"],
                    resources: [.glob(pattern: "Demo/Resources/**", excluding: [])],
                    dependencies: [],
                    settings: .settings(base: baseSettings, configurations: [])
                )
            )
        }
        
        // MARK: - UITests
        
        if targets.contains(.uiTests) {
            projectTargets.append(
                makeTarget(
                    name: "\(name)UITests",
                    destinations: destinations,
                    product: .uiTests,
                    bundleId: "\(bundleIdentifierPrefix).\(name)UITests",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .default,
                    sources: ["UITests/Sources/**"],
                    resources: nil,
                    dependencies: [
                        .xctest
                    ],
                    settings: .settings(base: baseSettings, configurations: [])
                )
            )
        }
        
        // MARK: - UnitTests
        
        if targets.contains(.unitTests) {
            projectTargets.append(
                makeTarget(
                    name: "\(name)UnitTests",
                    destinations: destinations,
                    product: .unitTests,
                    bundleId: "\(bundleIdentifierPrefix).\(name)UnitTests",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .default,
                    sources: ["UnitTests/Sources/**"],
                    resources: nil,
                    dependencies: [
                        .xctest
                    ],
                    settings: .settings(base: baseSettings, configurations: [])
                )
            )
        }
        
        return Project(
            name: name,
            organizationName: organizationName,
            options: .options(),
            packages: packages,
            settings: nil,
            targets: projectTargets,
            schemes: [],
            fileHeaderTemplate: nil,
            additionalFiles: [],
            resourceSynthesizers: .default
        )
    }
}
