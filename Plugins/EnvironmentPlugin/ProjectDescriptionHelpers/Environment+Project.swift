//
//  Environment+Project.swift
//  EnvironmentPlugin
//
//  Created by Yujin Kim on 2023-12-19.
//

import ProjectDescription

extension Project {
    public enum Environment {
        public static let workspaceName = "Zipthing"
        
        public static let bundleIdentifierPrefix = "com.zipthing-ios"
        
        public static let platform = Platform.iOS
        
        public static let destinations = Set(ProjectDescription.Destinations.iOS)
        
        public static let deploymentTargets = DeploymentTargets.iOS("15.0")
    }
}
