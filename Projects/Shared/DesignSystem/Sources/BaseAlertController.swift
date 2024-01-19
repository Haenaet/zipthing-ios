//
//  BaseAlertController.swift
//  DesignSystem
//
//  Created by se-ryeong on 1/19/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import SnapKit

class BaseAlertController: UIViewController {
    private lazy var alertView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .systemGray2
        view.layer.cornerRadius = 10
        view.axis = .vertical
        view.isLayoutMarginsRelativeArrangement = true
        view.spacing = 31
        view.layoutMargins = .init(top: 23, left: 10, bottom: 14, right: 10)
        view.addArrangedSubview(contentStackView)
        view.addArrangedSubview(actionStackView)
        
        return view
    }()
    
    // TODO: 컬러 변경해주기
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    // TODO: 컬러 변경해주기
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(messageLabel)
        view.spacing = 20
        view.axis = .vertical
        
        return view
    }()
    
    private var actionStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 8
        view.distribution = .fillEqually
        
        return view
    }()
    
    func addAction(_ actions: UIButton...) {
        actions.forEach {
            self.actionStackView.addArrangedSubview($0)
        }
    }
    
    init(title: String?, message: String?) {
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = title
        self.messageLabel.text = message
        
        self.modalPresentationStyle = .overCurrentContext
        NotificationCenter.default.addObserver(self, selector: #selector(self.dismissAlert), name: .dismissStandardAlert, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        addSubView()
        layout()
    }
    
    private func addSubView() {
        view.addSubview(alertView)
    }
    
    private func layout() {
        alertView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(42)
        }
        
        actionStackView.snp.makeConstraints {
            $0.height.equalTo(38)
        }
    }
    
    @objc func dismissAlert() {
        self.dismiss(animated: false)
    }
}
