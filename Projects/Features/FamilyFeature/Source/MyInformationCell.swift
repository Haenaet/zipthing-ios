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
//        view.layer.borderColor = DesignSystemAsset.Colors.wgray900.color.cgColor
        view.layer.borderColor = UIColor.gray.cgColor
        view.backgroundColor = .white
        
        return view
    }()
    
    let informationLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.title6
        
        return label
    }()
    
    let textCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0/30자"
        label.font = ZipthingFont.caption4
        
        return label
    }()
    
    let contentTextView: UITextView = {
        let view = UITextView()
        view.textContainerInset = .zero
        view.backgroundColor = .red
        view.font = ZipthingFont.body6

        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(informationView)
        informationView.addSubviews(informationLabel, contentTextView, textCountLabel)
        setLayout()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(item: MyInformationCellData, isOpened: Bool) {
        updateLayout(isOpened: isOpened)
        
        if isOpened {
            contentTextView.isHidden = false
            textCountLabel.isHidden = false
            informationLabel.text = item.title
            contentTextView.text = item.content
        } else {
            informationLabel.text = item.title
            contentTextView.isHidden = true
            textCountLabel.isHidden = true
        }
    }
    
    private func setLayout() {
        informationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-7)
        }
        
        informationLabel.snp.makeConstraints {
            $0.leading.equalTo(informationView.snp.leading).offset(16)
            $0.top.equalTo(informationView.snp.top).offset(9)
        }
        
        contentTextView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(informationLabel.snp.bottom).offset(11)
            $0.height.equalTo(20)
            $0.bottom.equalTo(textCountLabel.snp.top).offset(-11)
        }
        
        textCountLabel.snp.makeConstraints {
            $0.trailing.equalTo(informationView.snp.trailing).offset(-20)
            $0.bottom.equalTo(informationView.snp.bottom).offset(-12)
        }
    }
    
    private func updateLayout(isOpened: Bool) {
        if isOpened {
            informationLabel.snp.remakeConstraints {
                $0.leading.equalTo(informationView.snp.leading).offset(16)
                $0.top.equalToSuperview().inset(9)
            }
            
            contentTextView.snp.remakeConstraints {
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.top.equalTo(informationLabel.snp.bottom).offset(11)
                $0.height.equalTo(20)
                $0.bottom.equalTo(textCountLabel.snp.top).offset(-11)
            }
            
            textCountLabel.snp.remakeConstraints {
                $0.trailing.equalTo(informationView.snp.trailing).offset(-20)
                $0.bottom.equalTo(informationView.snp.bottom).offset(-12)
            }
        } else {
            informationLabel.snp.remakeConstraints {
                $0.leading.equalTo(informationView.snp.leading).offset(16)
                $0.top.bottom.equalToSuperview().inset(9)
            }
            
            contentTextView.snp.removeConstraints()
            textCountLabel.snp.removeConstraints()
        }
    }
}
