//
//  Dependency+Project.swift
//  EnvironmentPlugin
//
//  Created by Yujin Kim on 2023-12-19.
//

import ProjectDescription

public extension TargetDependency {
    enum Root: CaseIterable {
        case app, domain, thirdparty
        
        public var name: String {
            switch self {
            case .app: return "App"
            case .domain: return "Domain"
            case .thirdparty: return "ThirdParty"
            }
        }
        
        public var path: ProjectDescription.Path {
            switch self {
            case .app: return Path.relativeToRoot("Projects/" + self.name)
            case .domain: return Path.relativeToRoot("Projects/" + self.name)
            case .thirdparty: return Path.relativeToRoot("Projects/Shared" + self.name)
            }
        }
    }
    
    enum Feature: CaseIterable {
        case signin, signout, invite
        
        public var name: String {
            switch self {
            case .signin: return "SignInFeature"
            case .signout: return "SignOutFeature"
            case .invite: return "InviteFeature"
            }
        }
        
        public var path: ProjectDescription.Path {
            switch self {
            case .signin: return Path.relativeToRoot("Projects/Features/" + self.name)
            case .signout: return Path.relativeToRoot("Projects/Features/" + self.name)
            case .invite: return Path.relativeToRoot("Projects/Features/" + self.name)
            }
        }
    }
}
