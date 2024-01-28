//
//  BaseUIViewController.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2023-12-28.
//

import UIKit
import IQKeyboardManagerSwift

open class BaseUIViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setUI()
        setLayout()
        setDelegate()
        addTarget()
        deinitialize()
        setIQKeyboardManagerEnable()
    }
    
    open func setUI() {}
    
    open func setLayout() {}
    
    open func setDelegate() {}
    
    open func addTarget() {}
    
    open func deinitialize() {}
    
    deinit {
        debugPrint("\(self) is deinitialized. 🌈")
    }
}

extension BaseUIViewController {
    func setIQKeyboardManagerEnable() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
