//
//  FamilyFeatureViewController.swift
//  FamilyFeature
//
//  Created by se-ryeong on 2/6/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import DesignSystem
import UIKit

public class FamilyFeatureViewController: BaseUIViewController {
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("버튼", for: .normal)
        button.addTarget(self, action: #selector(didtapEditButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didtapEditButton() {
        let view = FamilyInfoEditViewController()
        view.modalPresentationStyle = .pageSheet
        self.present(view, animated: true)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    public override func setUI() {
        view.addSubviews(editButton)
    }
    
    public override func setLayout() {
        editButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
