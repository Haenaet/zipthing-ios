//
//  Extension+UINavigationController.swift
//  DesignSystem
//
//  Created by playhong on 2024/01/18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setBarAppearance() {
        let appearance: UINavigationBarAppearance = {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .systemYellow
            return appearance
        }()
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
