//
//  AnswerViewController.swift
//  QuestionFeature
//
//  Created by playhong on 2/18/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem
import IQKeyboardManagerSwift

protocol AnswerViewControllerDelegate: AnyObject {
    func keyboardWillShow(_ keyboardHeight: CGFloat)
    func keyboardWillHide()
    func swipeDownGesture()
    func swipeUpGesture()
}

public final class AnswerViewController: BaseUIViewController {
    weak var delegate: AnswerViewControllerDelegate?
    private var answerList: [String] = ["1"]
    
    // MARK: - Components
    
    private let emptyView = EmptyAnswerView()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.separatorInset = .zero
        return tv
    }()
    
    private let grabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystemAsset.black.color
        return view
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let keyboardTextField: UITextField = {
        let tx = UITextField()
        tx.backgroundColor = DesignSystemAsset.white.color
        tx.placeholder = "답변을 입력해주세요."
        tx.layer.borderColor = DesignSystemAsset.black.color.cgColor
        tx.layer.borderWidth = 2
        tx.layer.cornerRadius = 24
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        tx.leftView = padding
        tx.leftViewMode = .always
        return tx
    }()
    
    private let enterImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "enterButton")
        return iv
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setSwipeGesture()
        setKeyboard()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = false
    }
    
    public override func setUI() {
        view.backgroundColor = DesignSystemAsset.wgray03.color
        view.layer.cornerRadius = 12
        view.layer.borderColor = DesignSystemAsset.black.color.cgColor
        view.layer.borderWidth = 2
        view.isUserInteractionEnabled = true
        createTableHeaderView()
    }
    
    private func addSubviews() {
        view.addSubviews(grabBarView,
                         tableView,
                         bottomView)
        view.addSubviews(keyboardTextField,
                         enterImageView)
    }
    
    public override func setLayout() {
        addSubviews()
        createEmptyView()
        grabBarView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(40)
            $0.height.equalTo(0)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(grabBarView.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(14)
        }
        
        keyboardTextField.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(bottomView.snp.bottom)
        }
        
        enterImageView.snp.makeConstraints {
            $0.trailing.equalTo(keyboardTextField.snp.trailing).inset(16)
            $0.centerY.equalTo(bottomView.snp.centerY)
            $0.width.height.equalTo(0)
        }
    }
    
    private func createEmptyView() {
        if answerList.isEmpty {
            view.addSubview(emptyView)
            emptyView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }
    
    private func removeEmptyView() {
        if answerList.isEmpty == false {
            emptyView.removeFromSuperview()
        }
    }
    
    private func createTableHeaderView() {
        if answerList.isEmpty == false {
            let headerView = AnswerTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 37))
            tableView.tableHeaderView = headerView
        }
    }
    
    public override func setDelegate() {
        tableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setSwipeGesture() {
        let fullSwipeUp = UISwipeGestureRecognizer(target: self,
                                                   action: #selector(swipeUpGesture(recognizer:)))
        fullSwipeUp.direction = .up
        view.addGestureRecognizer(fullSwipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self,
                                                 action: #selector(swipeDownGesture(recognizer:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }
    
    private func setKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func updateGrapBarConstraints(detent: Detent) {
        switch detent {
        case .large:
            grabBarView.snp.updateConstraints {
                $0.height.equalTo(4)
            }
        case .medium:
            grabBarView.snp.updateConstraints {
                $0.height.equalTo(4)
            }
        case .down:
            grabBarView.snp.updateConstraints {
                $0.height.equalTo(0)
            }
        }
    }
    
    func updateKeyboardTextField(detent: Detent) {
        switch detent {
        case .large:
            break
        case .medium:
            bottomView.snp.updateConstraints {
                $0.top.equalTo(bottomView.snp.bottom).inset(50)
            }
            
            enterImageView.snp.updateConstraints {
                $0.width.height.equalTo(34)
            }
        case .down:
            bottomView.snp.updateConstraints {
                $0.top.equalTo(bottomView.snp.bottom)
            }
            
            enterImageView.snp.updateConstraints {
                $0.width.height.equalTo(0)
            }
        }
    }

    // MARK: - Action
    
    @objc private func keyboardWillShow(_ sender: Notification) {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        delegate?.keyboardWillShow(keyboardHeight)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            
            self.bottomView.snp.remakeConstraints {
                $0.top.equalTo(self.bottomView.snp.bottom).inset(50)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalToSuperview().inset(keyboardHeight)
            }
            
            self.keyboardTextField.snp.updateConstraints {
                $0.leading.trailing.equalToSuperview()
            }
            
            keyboardTextField.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide() {
        delegate?.keyboardWillHide()
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.bottomView.snp.remakeConstraints {
                $0.top.equalTo(self.bottomView.snp.bottom).inset(50)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(14)
            }
            
            self.keyboardTextField.snp.updateConstraints {
                $0.leading.trailing.equalToSuperview().inset(16)
            }
            
            keyboardTextField.layer.cornerRadius = 24
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func swipeUpGesture(recognizer: UISwipeGestureRecognizer) {
        delegate?.swipeUpGesture()
    }
    
    @objc private func swipeDownGesture(recognizer: UISwipeGestureRecognizer) {
        keyboardTextField.text = ""
        delegate?.swipeDownGesture()
    }
}

// MARK: - Extension

extension AnswerViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier)
                as? AnswerTableViewCell else { return .init() }
        return cell
    }
}

extension AnswerViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = 120
        let bottomInset: CGFloat = 10
        return height + bottomInset
    }
    
    /// Note: 테이블 뷰의 헤더뷰와 셀 사이의 Top 간격만 주고 싶어서 비어있는 뷰를 추가해서 높이를 줬음
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

