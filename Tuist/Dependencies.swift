//
//  Dependencies.swift
//  Tuist
//
//  Created by 박성원 on 2023-12-04.
//

import ProjectDescription

let packages: [ProjectDescription.Package] = [
    .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor(from: "5.7.1")),
    .remote(url: "https://github.com/hackiftekhar/IQKeyboardmanager.git", requirement: .upToNextMajor(from: "6.5.16")),
    .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMinor(from: "5.0.1"))
]

let dependencies = Dependencies(
    carthage: .none,
    swiftPackageManager: SwiftPackageManagerDependencies(
        packages,
        productTypes: [
            "Alamofire": .framework,
            "SnapKit": .framework,
            "IQKeyboardManagerSwift": .framework
        ]
    ),
    platforms: [.iOS]
)
