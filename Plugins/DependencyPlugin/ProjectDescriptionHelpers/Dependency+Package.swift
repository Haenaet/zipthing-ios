//
//  Dependency+Package.swift
//  EnvironmentPlugin
//
//  Created by Yujin Kim on 2023-12-19.
//

import ProjectDescription

extension TargetDependency {
    public static let Alamofire = TargetDependency.external(name: "Alamofire")
    public static let IQKeyboardManagerSwift = TargetDependency.external(name: "IQKeyboardManagerSwift")
    public static let SnapKit = TargetDependency.external(name: "SnapKit")
}
