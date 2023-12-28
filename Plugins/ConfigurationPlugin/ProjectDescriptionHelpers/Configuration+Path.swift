//
//  Configuration+Path.swift
//  ConfigurationPlugin
//
//  Created by Yujin Kim on 2023-12-25.
//

import ProjectDescription

// MARK: - Root Module

public enum Root: CaseIterable {
    case app, domain
    
    public var name: String {
        switch self {
        case .app: return "App"
        case .domain: return "Domain"
        }
    }
    
    public var path: ProjectDescription.Path {
        return .relativeToRoot("Projects/\(self.name)")
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}

// MARK: - Feature Module

public enum Features: CaseIterable  {
    case appEntryPoint, calendar, family, invite
    case questionBag, question, settings, signin
    
    public var name: String {
        switch self {
        case .appEntryPoint: return "AppEntryPointFeature"
        case .calendar: return "CalendarFeature"
        case .family: return "FamilyFeature"
        case .invite: return "InviteFeature"
        case .questionBag: return "QuestionBagFeature"
        case .question: return "QuestionFeature"
        case .settings: return "SettingsFeature"
        case .signin: return "SignInFeature"
        }
    }
    
    public var path: ProjectDescription.Path {
        return .relativeToRoot("Projects/Features/\(self.name)")
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}

// MARK: - Shared Module

public enum Shared: CaseIterable {
    case designSystem, thirdParty
    
    public var name: String {
        switch self {
        case .designSystem: return "DesignSystem"
        case .thirdParty: return "ThirdParty"
        }
    }
    
    public var path: ProjectDescription.Path {
        return .relativeToRoot("Projects/Shared/\(self.name)")
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}
