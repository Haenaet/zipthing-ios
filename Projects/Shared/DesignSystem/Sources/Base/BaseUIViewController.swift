//
//  BaseUIViewController.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2023-12-28.
//

import UIKit

open class BaseUIViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setUI()
        setLayout()
        setDelegate()
        addTarget()
        deinitialize()
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
