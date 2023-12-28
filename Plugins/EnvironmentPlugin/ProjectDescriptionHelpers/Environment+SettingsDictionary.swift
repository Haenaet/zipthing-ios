//
//  Environment+SettingsDictionary.swift
//  EnvironmentPlugin
//
//  Created by Yujin Kim on 2023-12-19.
//

import ProjectDescription

extension SettingsDictionary {
    public static let baseSettings: Self = [
        "OTHER_LDFLAGS" : [
            "$(inherited)",
            "-ObjC"
        ]
    ]
}
