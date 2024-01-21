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

extension UIViewController {
    
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
    
    
/// 2. 가운데 인디케이터만 보이고 인디케이터 활성화
/// - showIndicator(): 인디케이터가 화면에 나오며 활성화됩니다.
/// - removeIndicator(): 인디케이터가 화면에서 사라집니다.
    
    
    func showIndicator() {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.last else { return }
            
            let indicator: UIActivityIndicatorView
            if let existedView = window.subviews.first(where: { $0 is UIActivityIndicatorView } ) as? UIActivityIndicatorView {
                indicator = existedView
            } else {
                indicator = UIActivityIndicatorView(style: .large)
                indicator.frame = window.bounds
                indicator.color = .brown
                window.addSubview(indicator)
            }
            indicator.startAnimating()
        }
    }
    
    
    func removeIndicator() {
        
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.last else { return }
            
            window.subviews.filter { $0 is UIActivityIndicatorView }.forEach { $0.removeFromSuperview() }
        }
    }
    
}

