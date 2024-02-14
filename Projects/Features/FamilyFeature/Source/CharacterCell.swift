//
//  CharacterCell.swift
//  FamilyFeature
//
//  Created by se-ryeong on 2/14/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import SnapKit
import DesignSystem

class CharacterCell: UICollectionViewCell {
    static let identifier = "CharacterCell"
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = DesignSystemAsset.Images.tree.image
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(imageView)
        setLayout()
//        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.top.equalToSuperview().offset(7)
            $0.edges.equalToSuperview()
        }
    }
}
