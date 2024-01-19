//
//  Extension+Indicator3.swift
//  DesignSystem
//
//  Created by 박성원 on 1/19/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit


/// 3. 얼럿창처럼 인디케이터가 화면에 보임
/// - showActivityIndicator(text: String): 글자를 입력하여 인디케이터와 글자가 보입니다.
/// - removeActivityIndicator(): 인디케이터가 화면에서 사라집니다.


public class ActivityIndicator {
    
    let activityIndicatorView = UIView()
    let backgroundView: UIView
    
    let activityIndicator = UIActivityIndicatorView()
    let indicatorLabel = UILabel()
    
    init(backgroundView: UIView) {
        self.backgroundView = backgroundView
    }
    
    func showActivityIndicator(text: String) {
        activityIndicatorView.frame = CGRect(x: 0.0, y: 0.0, width: 100, height: 100)
        activityIndicatorView.center = CGPoint(x: self.backgroundView.frame.size.width / 2.0, y: (self.backgroundView.frame.size.height) / 2.0)
        activityIndicatorView.layer.cornerRadius = 16
        activityIndicatorView.backgroundColor = .lightGray // ❗️색바꾸기
        backgroundView.addSubview(activityIndicatorView)
        
        
        activityIndicator.center = CGPoint(x: activityIndicatorView.frame.size.width / 2.0, y: (activityIndicatorView.frame.size.height) / 2.0)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .darkGray // ❗️색바꾸기
        activityIndicatorView.addSubview(activityIndicator)
        
        
        indicatorLabel.textColor = .darkGray // ❗️색바꾸기
        indicatorLabel.text = text
        indicatorLabel.font = UIFont(name: "Light", size: 12) // ❗️글자 크기 바꾸기
        indicatorLabel.sizeToFit()
        indicatorLabel.center = CGPoint(x: activityIndicator.center.x, y: activityIndicator.center.y + 32)
        activityIndicatorView.addSubview(indicatorLabel)
        
        
        backgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        backgroundView.backgroundColor = .clear
        
        
        activityIndicator.startAnimating()
    }
    
    func removeActivityIndicator() {
        activityIndicatorView.removeFromSuperview()
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}

