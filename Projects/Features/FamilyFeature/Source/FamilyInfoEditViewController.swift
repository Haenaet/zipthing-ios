//
//  FamilyInfoEditViewController.swift
//  FamilyFeature
//
//  Created by se-ryeong on 2/6/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem

class FamilyInfoEditViewController: BaseUIViewController {
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.titleLabel?.font = UIFont().pretendard(ofSize: 20, weight: .medium)
        button.tintColor = .black
        
        return button
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장", for: .normal)
        button.titleLabel?.font = UIFont().pretendard(ofSize: 20, weight: .extraBold)
        button.tintColor = .black
        
        return button
    }()
    
    private var myInformationLabel: UILabel = {
        let label = UILabel()
        label.text = "내 정보"
        label.font = UIFont().pretendard(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "별명"
        label.font = UIFont().pretendard(ofSize: 16, weight: .extraBold)
        
        return label
    }()
    
    private var nicknameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "ex. 똥강아지"
        textfield.borderStyle = .roundedRect
        
        return textfield
    }()
    
    private var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대폰 번호"
        label.font = UIFont().pretendard(ofSize: 16, weight: .extraBold)
        
        return label
    }()
    
    private var phoneNumberTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "ex. 010-1234-5678"
        textfield.borderStyle = .roundedRect
        
        return textfield
    }()
    
    private var birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "생일"
        label.font = UIFont().pretendard(ofSize: 16, weight: .extraBold)
        
        return label
    }()
    
    private var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        
        return datePicker
    }()
    
    private var myCharacterLabel: UILabel = {
        let label = UILabel()
        label.text = "내 캐릭터"
        label.font = UIFont().pretendard(ofSize: 16, weight: .extraBold)
        
        return label
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        
        return scrollView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.identifier)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = DesignSystemAsset.Colors.yellow050.color
        setUI()
        setLayout()
        setDelegate()
    }
    
    override func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubviews(cancelButton, editButton, myInformationLabel, nicknameLabel, nicknameTextField, phoneNumberLabel, phoneNumberTextField, birthdayLabel, datePicker, myCharacterLabel, collectionView)
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(view.frame.width)
//            $0.height.equalTo(view.frame.height)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(22)
        }
        
        editButton.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(22)
        }
        
        myInformationLabel.snp.makeConstraints {
            $0.leading.equalTo(cancelButton.snp.trailing).offset(117)
            $0.trailing.equalTo(editButton.snp.leading).offset(-117)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(22)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.top.equalTo(cancelButton.snp.bottom).offset(31)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
            $0.height.equalTo(50)
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(28)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(50)
        }
        
        birthdayLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(28)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        datePicker.snp.makeConstraints {
            $0.top.equalTo(birthdayLabel.snp.bottom).offset(7)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        myCharacterLabel.snp.makeConstraints {
            $0.top.equalTo(datePicker.snp.bottom).offset(28)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.top.equalTo(myCharacterLabel.snp.bottom).offset(7)
            $0.height.equalTo(50)
        }
    }
}

extension FamilyInfoEditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell
        else { return .init() }
        
        return cell
    }
}

extension FamilyInfoEditViewController {
    private func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        return layout
    }
}
