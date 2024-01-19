//
//  Extension+UINavigationController.swift
//  DesignSystem
//
//  Created by playhong on 2024/01/18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

extension UINavigationController {
    public func setBarAppearance() {
        let appearance: UINavigationBarAppearance = {
            let appearance = UINavigationBarAppearance()
            // 네비게이션 바의 배경색 설정
            appearance.backgroundColor = .systemYellow
            // 네비게이션 바의 타이틀 폰트 및 글자색 설정
            appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0), .foregroundColor: UIColor.black]
            return appearance
        }()
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
