//
//  MyInformationCell.swift
//  FamilyFeature
//
//  Created by se-ryeong on 2/17/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem

class MyInformationCell: UITableViewCell {
    static let identifier = "MyInformationCell"
    
    let informationView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = DesignSystemAsset.Colors.wgray900.color.cgColor
        view.backgroundColor = .white
        
        return view
    }()
    
    let informationLabel: UILabel = {
        let label = UILabel()
//        label.text = "나의 MBTI"
        label.font = UIFont().pretendard(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "contentLabel"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(informationView)
        informationView.addSubviews(informationLabel, contentLabel)
        setLayout()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        informationView.frame = informationView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 7, right: 0))
    }
    
    func setLayout() {
        informationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        informationLabel.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
            $0.leading.equalTo(informationView.snp.leading).offset(16)
//            $0.top.bottom.equalToSuperview().inset(9)
            $0.top.equalTo(informationView.snp.top).offset(9)
        }
        
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(informationView.snp.leading).offset(16)
            $0.top.equalTo(informationLabel.snp.bottom).offset(11)
        }
    }
}
