//
//  UserDefaults.swift
//  DesignSystem
//
//  Created by 박성원 on 1/27/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation


@propertyWrapper
public struct UserDefault<T> {
    
    let key: String
    let defaultValue: T
    
    public var wrappedValue: T {
        get {
            return UserDefaults.standard.value(forKey: self.key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
        }
    }
}
