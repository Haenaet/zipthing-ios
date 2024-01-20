//
//  Extension+UIView.swift
//  DesignSystem
//
//  Created by playhong on 2024/01/18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
