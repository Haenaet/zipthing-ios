//
//  AnswerTableViewCell.swift
//  QuestionFeature
//
//  Created by playhong on 2/18/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem

final class AnswerTableViewCell: BaseUITableViewCell<String> {
    private let userImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person")
        iv.tintColor = .gray
        iv.layer.borderColor = DesignSystemAsset.black.color.cgColor
        iv.layer.borderWidth = 1
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        return iv
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.subTitle4
        label.text = "나는 아빠"
        return label
    }()
    
    private let writingTimeLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.caption4
        label.text = "30분 전"
        label.textColor = DesignSystemAsset.wgray07.color
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.body2
        label.text = "나는 찍먹이지요~"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15))
    }
    
    override func setUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.backgroundColor = DesignSystemAsset.white.color
        contentView.layer.borderColor = DesignSystemAsset.black.color.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
    }
    
    override func setLayout() {
        contentView.addSubviews(userImageView,
                                userNameLabel,
                                writingTimeLabel,
                                contentLabel)
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(30)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalTo(userImageView.snp.trailing).offset(10)
        }
        
        writingTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}

