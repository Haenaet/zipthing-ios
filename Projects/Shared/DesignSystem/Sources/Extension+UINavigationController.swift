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
        
        // NOTE: 일정 페이지, 가족 페이지에서 네비게이션 바의 타이틀이 왼쪽으로 정렬되어 있어서 추가만 해놓겠습니다.
        // 네비게이션 바의 타이틀 왼쪽 정렬
        appearance.titlePositionAdjustment = UIOffset(horizontal: -(view.frame.width / 2.5),
                                                      vertical: 0)
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
