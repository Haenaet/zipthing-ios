//
//  EmptyAnswerView.swift
//  QuestionFeature
//
//  Created by playhong on 2/18/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem

final class EmptyAnswerView: UIView {
    // MARK: - Components
    
    private let emptyImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "emptyAnswer")
        return iv
    }()
    
    private let emptyPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.text = """
                        아직 답변이 없어요 ㅠㅠ!
                        내가 먼저 답변을 남겨보세요!
                     """
        label.textColor = .gray
        label.textAlignment = .center
        label.font = ZipthingFont.body6
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - Life Cycle
    
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
        self.layer.cornerRadius = 12
    }
    
    private func setLayout() {
        self.addSubviews(emptyImageView,
                        emptyPlaceholderLabel)
        
        emptyImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(130)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        emptyPlaceholderLabel.snp.makeConstraints {
            $0.top.equalTo(emptyImageView.snp.bottom).offset(56)
            $0.centerX.equalToSuperview()
        }
    }
}

