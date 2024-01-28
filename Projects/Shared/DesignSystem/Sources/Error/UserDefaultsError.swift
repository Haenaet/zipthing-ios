//
//  UserDefaultsError.swift
//  DesignSystem
//
//  Created by 박성원 on 1/28/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation


enum UserDefaultsError: Error {
    case noData
}

extension UserDefaultsError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noData:
            return "UserDefaults값 가져오지 못함"
        }
    }
}
