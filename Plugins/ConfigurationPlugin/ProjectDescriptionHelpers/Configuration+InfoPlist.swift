//
//  Configuration+InfoPlist.swift
//  ConfigurationPlugin
//
//  Created by Yujin Kim on 2023-12-25.
//

import ProjectDescription

extension Project {
    public static let infoPlist: [String: Plist.Value] = [
        "CFBundleDevelopmentRegion": "ko",
        "CFBundleShortVersionString": "1.0",
        "CFBundleVersion": "1",
        "CFBundleIdentifier": "com.zipthing-ios.app",
        "CFBundleDisplayName": "집띵",
        "UILaunchStoryboardName": "LaunchScreen",
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ]
                ]
            ]
        ],
        "UIAppFonts": [
            "item 0": "Pretendard-Black.otf",
            "item 1": "Pretendard-Bold.otf",
            "item 2": "Pretendard-ExtraBold.otf",
            "item 3": "Pretendard-ExtraLight.otf",
            "item 4": "Pretendard-Light.otf",
            "item 5": "Pretendard-Medium.otf",
            "item 6": "Pretendard-Regular.otf",
            "item 7": "Pretendard-SemiBold.otf",
            "item 8": "Pretendard-Thin.otf"
        ],
        "App Transport Security Settings": [
            "Allow Arbitrary Loads": true
        ]
    ]
}
