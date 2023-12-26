//
//  Environment.swift
//  EnvironmentPlugin
//
//  Created by Yujin Kim on 2023-12-19.
//

import ProjectDescription

public extension Project {
    enum Environment {
        public static let workspaceName = "Zipthing"
        
        public static let bundleIdentifier = "com.zipthing-iOS"
        
        public static let platform = Platform.iOS
        
        public static let deploymentTarget = DeploymentTargets.iOS("15.0")
    }
}
