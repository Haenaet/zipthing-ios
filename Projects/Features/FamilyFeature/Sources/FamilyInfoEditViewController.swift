//
//  FamilyInfoEditViewController.swift
//  FamilyFeature
//
//  Created by se-ryeong on 2/6/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem

public enum CharaterType: CaseIterable {
    case egg
    case fish
    case star
    case sun
    case tomato
    case tree
    
    var image: UIImage {
        switch self {
            
        case .egg:
            return DesignSystemAsset.Images.egg.image
        case .fish:
            return DesignSystemAsset.Images.fish.image
        case .star:
            return DesignSystemAsset.Images.star.image
        case .sun:
            return DesignSystemAsset.Images.sun.image
        case .tomato:
            return DesignSystemAsset.Images.tomato.image
        case .tree:
            return DesignSystemAsset.Images.tree.image
        }
    }
}

struct MyInformationCellData {
    var isOpened = Bool() // 셀이 접혔는지 펴졌는지 확인하기 위한 변수
    var title = String()
    var content = String()
}

class FamilyInfoEditViewController: BaseUIViewController {

//    var stringCharacters: [String] = ["tree", "egg", "fish", "star", "sun", "tomato"]
    
    var characters = CharaterType.allCases
    
    var tableViewData = [MyInformationCellData]()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.titleLabel?.font = ZipthingFont.title8
        button.tintColor = .black
        
        return button
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장", for: .normal)
        button.titleLabel?.font = ZipthingFont.title6
        button.tintColor = .black
        
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "내 정보"
        label.font = ZipthingFont.title6
        
        return label
    }()
    
    private var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "별명"
        label.font = ZipthingFont.body6
        
        return label
    }()
    
    private var nicknameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "ex. 똥강아지"
        textfield.borderStyle = .roundedRect
        textfield.font = ZipthingFont.title8
        
        return textfield
    }()
    
    private var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대폰 번호"
        label.font = ZipthingFont.body6
        
        return label
    }()
    
    private var phoneNumberTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "ex. 010-1234-5678"
        textfield.borderStyle = .roundedRect
        textfield.font = ZipthingFont.title8
        
        return textfield
    }()
    
    private var birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "생일"
        label.font = ZipthingFont.body6
        
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
        label.font = ZipthingFont.body6
        
        return label
    }()
    
    private var myInformationLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 정보"
        label.font = ZipthingFont.body6
        
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
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(MyInformationCell.self, forCellReuseIdentifier: MyInformationCell.identifier)
        view.backgroundColor = .clear
        view.isScrollEnabled = false
        view.separatorStyle = .none
        
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = DesignSystemAsset.Colors.yellow01.color
        setUI()
        setLayout()
        setDelegate()
        
        tableViewData = [MyInformationCellData(isOpened: false, title: "나의 발사이즈", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "나의 MBTI", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "나의 취미", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "내가 좋아하는 음식", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "내가 좋아하는 책", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "내가 좋아하는 가수", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "내가 좋아하는 브랜드", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "내가 좋아하는 프로그램", content: "어쩌구 저쩌구"),
                         MyInformationCellData(isOpened: false, title: "내가 좋아하는 영화", content: "어쩌구 저쩌구")]
    }
    
    override func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.dataSource = self
        tableView.delegate = self
    }
        
    override func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubviews(cancelButton, editButton, titleLabel, nicknameLabel, nicknameTextField, phoneNumberLabel, phoneNumberTextField, birthdayLabel, datePicker, myCharacterLabel, collectionView, myInformationLabel, tableView)
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(view.frame.width)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.equalTo(scrollView).offset(16)
            $0.top.equalTo(scrollView).offset(22)
        }
        
        editButton.snp.makeConstraints {
            $0.trailing.equalTo(scrollView).offset(-16)
            $0.top.equalTo(scrollView).offset(22)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(cancelButton.snp.trailing).offset(117)
            $0.trailing.equalTo(editButton.snp.leading).offset(-117)
            $0.top.equalTo(scrollView).offset(22)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalTo(scrollView).offset(16)
            $0.top.equalTo(cancelButton.snp.bottom).offset(31)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(scrollView).inset(16)
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
            $0.height.equalTo(50)
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(28)
            $0.leading.equalTo(scrollView).offset(16)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(scrollView).inset(16)
            $0.height.equalTo(50)
        }
        
        birthdayLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(28)
            $0.leading.equalTo(scrollView).offset(16)
        }
        
        datePicker.snp.makeConstraints {
            $0.top.equalTo(birthdayLabel.snp.bottom).offset(7)
            $0.leading.equalTo(scrollView).offset(16)
            $0.width.equalTo(100)
        }
        
        myCharacterLabel.snp.makeConstraints {
            $0.top.equalTo(datePicker.snp.bottom).offset(28)
            $0.leading.equalTo(scrollView).offset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalTo(scrollView).inset(16)
            $0.top.equalTo(myCharacterLabel.snp.bottom).offset(7)
            $0.height.equalTo(50)
        }
        
        myInformationLabel.snp.makeConstraints {
            $0.leading.equalTo(scrollView).offset(16)
            $0.top.equalTo(collectionView.snp.bottom).offset(28)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalTo(scrollView).inset(16)
            $0.top.equalTo(myInformationLabel.snp.bottom).offset(7)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(500)
        }
    }
}

extension FamilyInfoEditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell else {
            return UICollectionViewCell()
        }
        
        // String 1
//        let characterName1 = stringCharacters[indexPath.item]
//        let image = DesignSystemImages.Image(named: characterName1)
//        cell.imageView.image = image
//
        // Enum 1
        let image = characters[indexPath.row].image
        cell.imageView.image = image
        
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

extension FamilyInfoEditViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isOpened == true {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyInformationCell.identifier, for: indexPath) as? MyInformationCell
        else { return UITableViewCell() }
        
        let data = tableViewData[indexPath.section]
        cell.configureCell(item: data, isOpened: data.isOpened)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            tableViewData[indexPath.section].isOpened.toggle()
            tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
}
