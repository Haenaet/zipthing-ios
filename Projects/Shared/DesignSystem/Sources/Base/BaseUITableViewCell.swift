//
//  BaseUITableViewCell.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2024-01-18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

open class BaseUITableViewCell<M>: UITableViewCell {
    open class var identifier: String {
        return String(describing: self)
    }
    
    open var model: M? {
        didSet {
            guard let model = model else { return }
            bind(model: model)
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
