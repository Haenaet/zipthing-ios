//
//  UIViewController+.swift
//  DesignSystem
//
//  Created by se-ryeong on 1/19/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import SwiftUI

public extension UIViewController {
    func singleActionAlert(title: String?, message: String?, actionTitle: String, handler: (()->Void)?) {
        let alert = BaseAlertController(title: title, message: message)
        let action = BaseAlertAction(title: actionTitle, style: .basic) { _ in
            handler?()
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: false)
    }
    
    func twoActionAlert(title: String?,
                        message: String?,
                        actionTitle1: String,
                        handler1: (()->Void)?,
                        actionTitle2: String,
                        handler2: (()->Void)?
    ) {
        let alert = BaseAlertController(title: title, message: message)
        let action1 = BaseAlertAction(title: actionTitle1, style: .basic) { _ in
            handler1?()
        }
        
        let action2 = BaseAlertAction(title: actionTitle2, style: .basic) { _ in
            handler2?()
        }
        
        alert.addAction(action1, action2)
        
        self.present(alert, animated: false)
    }
}
