//
//  Dependency+Package.swift
//  EnvironmentPlugin
//
//  Created by Yujin Kim on 2023-12-19.
//

import ProjectDescription

public extension TargetDependency {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let IQKeyboardManager = TargetDependency.external(name: "IQKeyboardManager")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
}
