//
//  QuestionViewController.swift
//  QuestionFeature
//
//  Created by playhong on 2/18/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit
import DesignSystem

final class QuestionViewController: BaseUIViewController {
    
    // MARK: - Components
    
    private let childViewController = AnswerViewController()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [questionBagButton, contentStackView])
        sv.axis = .vertical
        sv.alignment = .trailing
        sv.distribution = .fill
        sv.spacing = 139
        return sv
    }()
    
    private let questionBagButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "timer")
        configuration.imagePadding = 6
        configuration.title = "지난 질문"
        configuration.attributedTitle?.font = ZipthingFont.subTitle4
        let button = UIButton(configuration: configuration)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 22
        return button
    }()
    
    private lazy var contentStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, questionStackView])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fill
        sv.spacing = 28
        return sv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.subTitle3
        label.text = "오늘의 질문"
        return label
    }()
    
    private lazy var questionStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [questionLabel, answerLabel])
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 5
        return sv
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.title2
        label.text = "나의 탕수육 스타일은?"
        return label
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.title2
        label.text = "부먹 vs 찍먹"
        return label
    }()
    
    private lazy var swipeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [swipeUpPlaceholderLabel, swipeUpImageView])
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fill
        sv.spacing = 7
        sv.isUserInteractionEnabled = true
        return sv
    }()
    
    private let swipeUpPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = ZipthingFont.body6
        label.text = "열어서 답변 달기"
        label.textColor = DesignSystemAsset.wgray10.color
        return label
    }()
    
    private lazy var swipeUpImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "slide")
        return iv
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setChildViewController()
        setSwipeGesture()
    }

    override func setUI() {
        view.backgroundColor = DesignSystemAsset.yellow05.color
        
    }
    
    override func setLayout() {
        addSubviews()

        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        let questionLabelWidth = view.frame.size.width - 32.0
        questionLabel.snp.makeConstraints {
            $0.width.equalTo(questionLabelWidth)
        }
        
        questionBagButton.snp.makeConstraints {
            $0.width.equalTo(109)
            $0.height.equalTo(44)
        }

        swipeStackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(43)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func addSubviews() {
        view.addSubviews(stackView,
                         swipeStackView)
    }
    
    override func setDelegate() {
        childViewController.delegate = self
    }
    
    private func setSwipeGesture() {
        let halfSwipeUp = UISwipeGestureRecognizer(target: self,
                                               action: #selector(handleHalfSwipeUpGesture(recognizer:)))
        halfSwipeUp.direction = .up
        swipeStackView.addGestureRecognizer(halfSwipeUp)
    }
    
    private func setChildViewController() {
        addChild(childViewController)
        view.addSubview(childViewController.view)
        view.addConstraints(childViewController.view.constraints)
        childViewController.didMove(toParent: self)
        
        childViewController.view.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
            $0.height.equalTo(118)
        }
    }
    
    // MARK: - Action
    
    @objc private func questionBagButtonTapped(_ sender: UIButton) {
        print("지난 질문 버튼을 눌렀습니다.")
    }
    
    @objc private func handleHalfSwipeUpGesture(recognizer: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.stackView.snp.updateConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(-130)
            }

            self.childViewController.view.snp.updateConstraints {
                $0.height.equalTo(594)
            }
            
            self.childViewController.updateGrapBarConstraints(detent: .medium)
            self.childViewController.updateKeyboardTextField(detent: .medium)
            self.view.layoutIfNeeded()
        } completion: { _ in
            print("일단 중간으로 올릴게!")
        }
    }
}

// MARK: - Extension

extension QuestionViewController: AnswerViewControllerDelegate {
    func updateParentView() {
    }
    
    func swipeDownGesture() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.stackView.snp.updateConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(16)
            }
            
            self.childViewController.view.snp.updateConstraints {
                $0.height.equalTo(118)
            }
            
            self.childViewController.updateGrapBarConstraints(detent: .down)
            self.childViewController.updateKeyboardTextField(detent: .down)
            self.view.layoutIfNeeded()
        } completion: { status in
            print("일단 내려봐")
        }
    }
    
    func swipeUpGesture() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.childViewController.view.snp.updateConstraints {
                $0.height.equalTo(793)
            }
            
            self?.view.layoutIfNeeded()
        } completion: { _ in
            print("일단 끝까지 올릴게!")
        }
    }
}