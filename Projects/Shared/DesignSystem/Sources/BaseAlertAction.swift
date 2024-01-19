//
//  BaseAlertAction.swift
//  DesignSystem
//
//  Created by se-ryeong on 1/19/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

enum BaseAlertStyle {
    case cancel
    case basic
}

class BaseAlertAction: UIButton {
    let handler: ((BaseAlertAction) -> Void)?
    
    init(title: String?, style: BaseAlertStyle, handler: ((BaseAlertAction) -> Void)? = nil) {
        self.handler = handler
        super.init(frame: .zero)
        
        // TODO: 컬러 변경해주기
        switch style {
        case .cancel:
            self.backgroundColor = .red
            self.setTitleColor(.black, for: .normal)
        case .basic:
            self.backgroundColor = .systemGray6
            self.setTitleColor(.black, for: .normal)
        }
        
        // TODO: 폰트 설정해주기
        self.titleLabel?.font = .systemFont(ofSize: 16)
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(didClickAction), for: .touchUpInside)
        self.layer.cornerRadius = 6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didClickAction() {
        NotificationCenter.default.post(name: .dismissStandardAlert , object: nil)
        guard let handler = handler else { return }
        handler(self)
    }
}
