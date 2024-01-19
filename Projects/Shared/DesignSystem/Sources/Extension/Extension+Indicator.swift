//
//  Extension+Indicator.swift
//  DesignSystem
//
//  Created by 박성원 on 1/19/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//


import UIKit


/// 1. 전체 화면 살짝 회색이 되며, 가운데 인디케이터 활성화
/// - showSpinner(): 배경 화면이 살짝 회색이 되며, 인디케이터가 화면에 나오며 활성화됩니다.
/// - removeSpinner(): 인디케이터가 화면에서 사라집니다.


fileprivate var indicatorView: UIView?

public extension UIViewController {
    
    func showSpinner() {
        indicatorView = UIView(frame: self.view.bounds)
        indicatorView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        self.view.addSubview(indicatorView!)
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = indicatorView!.center
        indicator.color = .green // ❗️색바꾸기
        indicatorView?.addSubview(indicator)
        indicator.startAnimating()
    }
    
    
    func removeSpinner() {
        indicatorView?.removeFromSuperview()
        indicatorView = nil
    }
    
}

