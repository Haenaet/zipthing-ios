//
//  BaseUICollectionViewCell.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2024-01-18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

open class BaseUICollectionViewCell<M>: UICollectionViewCell {
    
    open class var identifier: String {
        return String(describing: self)
    }
    
    open var model: M? {
        didSet {
            guard let model = model else { return }
            bind(model: model)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setLayout() {}
    
    open func setUI() {}
    
    open func bind(model: M) {}
}
