//
//  Extension+UIFont.swift
//  DesignSystem
//
//  Created by playhong on 2024/01/18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

extension UIFont {
    public func pretendard(ofSize: CGFloat, weight: PretendardFont.Weight) -> UIFont {
        let fontName = "\(PretendardFont.familyName)-\(weight.rawValue)"
        let basicFont = UIFont.systemFont(ofSize: ofSize)
        return UIFont(name: fontName, size: ofSize) ?? basicFont
    }
}
