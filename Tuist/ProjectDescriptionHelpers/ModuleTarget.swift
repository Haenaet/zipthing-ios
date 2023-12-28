//
//  ModuleTarget.swift
//  ProjectDescriptionHelpers
//
//  Created by Yujin Kim on 2023-12-28.
//

import ProjectDescription

public enum ModuleTarget {
    case app, demo, framework, staticFramework, unitTests, uiTests
    
    public var hasFramework: Bool {
        switch self {
        case .framework, .staticFramework: return true
        default: return false
        }
    }
    
    public var hasDynamicFramework: Bool {
        return self == .framework
    }
}
