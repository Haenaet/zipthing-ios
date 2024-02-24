//
//  AnswerTableHeaderView.swift
//  QuestionFeature
//
//  Created by playhong on 2/18/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem

final class AnswerTableHeaderView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.title6
        label.text = "답변"
        label.textColor = DesignSystemAsset.black.color
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [latestOrderButton, timeOrderButton])
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 8
        return sv
    }()
    
    private let latestOrderButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "최신순"
        configuration.attributedTitle?.font = ZipthingFont.subTitle4
        let button = UIButton(configuration: configuration)
        button.backgroundColor = DesignSystemAsset.black.color
        button.tintColor = DesignSystemAsset.white.color
        button.layer.cornerRadius = 4
        return button
    }()
    
    private let timeOrderButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "시간순"
        configuration.attributedTitle?.font = ZipthingFont.subTitle4
        let button = UIButton(configuration: configuration)
        button.backgroundColor = DesignSystemAsset.wgray07.color
        button.tintColor = DesignSystemAsset.white.color
        button.layer.cornerRadius = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    
    private func setLayout() {
        self.addSubviews(titleLabel, buttonStackView)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        /// Note: 실제 앱에서 적용하는 폰트 적용 후 버튼 높이, 넓이 수정해야함.
        /// 폰트 크기가 안맞는지 넓이를 피그마 디자인과 동일하게 맞추면 텍스트가 두 줄로 됨. ㅠ
        
        latestOrderButton.snp.makeConstraints {
            $0.width.equalTo(65)
            $0.height.equalTo(30)
        }
        
        timeOrderButton.snp.makeConstraints {
            $0.width.equalTo(65)
            $0.height.equalTo(30)
        }
    }
}
