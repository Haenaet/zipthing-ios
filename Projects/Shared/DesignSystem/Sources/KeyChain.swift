//
//  KeyChain.swift
//  DesignSystem
//
//  Created by 박성원 on 1/27/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation
import Security


public class KeyChain {
    
    
    //Create
    static func create(key: String, token: String) -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: token.data(using: .utf8, allowLossyConversion: false) as Any
        ]
        let result: Bool = {
            let status = SecItemAdd(query as CFDictionary, nil)
            if status == errSecSuccess {
                return true
            } else if status == errSecDuplicateItem {
                return update(key: key, token: token)
            }
            
            print("addItem Error : \(status.description))")
            return false
        }()
        
        return result
    }
    
    
    // Read
    static func read(key: Any) -> Any? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnAttributes: true,
            kSecReturnData: true
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess {
            if let existingItem = item as? [String: Any],
               let data = existingItem[kSecValueData as String] as? Data,
               let password = String(data: data, encoding: .utf8) {
                return password
            }
        }
        print("getItem Error : \(status.description)")
        return nil
    }
    
    
    //Update
    static func update(key: String, token: String) -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        let updateQuery: [CFString: Any] = [
            kSecValueData: token.data(using: .utf8, allowLossyConversion: false) as Any
        ]
        
        let result: Bool = {
            let status = SecItemUpdate(query as CFDictionary, updateQuery as CFDictionary)
            if status == errSecSuccess {
                return true
            }
            print("updateItem Error : \(status.description)")
            return false
        }()
        
        return result
    }
    
    
    // Delete
    static func delete(key: String) -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
    
        if status == errSecSuccess {
            return true
        }
        print("deleteItem Error : \(status.description)")
        return false
    }
}

