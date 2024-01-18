//
//  BaseUITableView.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2024-01-18.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

open class BaseUITableView<M, Cell: BaseUITableViewCell<M>>: UITableView, UITableViewDataSource {
    open var dataList: [M] = [] {
        didSet {
            reloadData()
        }
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setDataSource() {
        dataSource = self
    }
    
    open func register(cell: Cell.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    open func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        dataList.count
    }
    
    open func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
