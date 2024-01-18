//
//  BaseUICollectionView.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2024-01-18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

open class BaseUICollectionView<M, Cell: BaseUICollectionViewCell<M>>: UICollectionView, UICollectionViewDataSource {
    open var dataList: [M] = [] {
        didSet {
            reloadData()
        }
    }
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setDataSource()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setDataSource() {
        dataSource = self
    }
    
    open func register(cell: Cell.Type) {
        register(cell, forCellWithReuseIdentifier: String(describing: cell))
    }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return dataList.count
    }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}
