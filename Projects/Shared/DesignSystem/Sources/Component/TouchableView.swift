//
//  TouchableView.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2024-01-16.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import UIKit

fileprivate class TapGestureRecognizer: UITapGestureRecognizer {
    var onTapped: (() -> Void)?
    var onTappedToPosition: ((CGPoint) -> Void)?
}

public class TouchableView: UIView {
    fileprivate var impactFeedbackGenerator: UIImpactFeedbackGenerator?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 커스텀 옵션으로 새로운 TouchableView 객체를 초기화하고 반환하는 메서드
    /// - Parameters:
    ///   - isVibrate: true로 설정하면 진동을 활성화할 수 있습니다. 기본값은 false입니다.
    ///   - style: UIImpactFeedbackGenerator 진동 세기를 설정할 수 있다고 합니다. 기본값은 .light로 설정했습니다.
    convenience init(isVibrate: Bool = false, style: UIImpactFeedbackGenerator.FeedbackStyle = .light) {
        self.init()
        self.impactFeedbackGenerator = isVibrate ? UIImpactFeedbackGenerator(style: style) : nil
    }
    
    /// 주어진 CGPoint 값이 리시버에 포함되는지 확인하는 오버라이드 메서드
    /// - Parameters:
    ///   - point: 리시버의 로컬 좌표계(바운드)로 지정된 값입니다.
    ///   - event: 이 메서드를 호출하는 데 필요한 이벤트입니다. nil로 지정할 수 있습니다.
    /// - Returns: CGPoint 값이 리시버의 바운드 내에 있으면 true이고, 그렇지 않으면 false입니다.
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        
        let touchArea = bounds.insetBy(dx: -10, dy: -15)
        return touchArea.contains(point)
    }
}

// MARK: - Custom Method

extension TouchableView {
    /// 불투명한 배경과 함께 탭 제스처 인식기를 설정하고 액션 클로저를 연결합니다.
    /// - Parameter action: 탭 제스처 인식기가 트리거될 때 실행할 클로저입니다.
    public func setOpaqueTapGestureRecognizer(action: @escaping () -> Void) {
        let tapGestureRecognizer = TapGestureRecognizer(target: self, action: #selector(effect(_:)))
        tapGestureRecognizer.onTapped = action
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// 불투명한 배경과 함께 탭 제스처 인식기를 설정하고 터치된 위치를 제공하는 액션 클로저를 연결합니다.
    /// - Parameter action: 탭 제스처 인식기가 트리거될 때 실행할 클로저입니다.
    public func setOpaquePositionTapGestureRecognizer(action: @escaping (CGPoint) -> Void) {
        let tapGestureRecognizer = TapGestureRecognizer(target: self, action: #selector(effect(_:)))
        tapGestureRecognizer.onTappedToPosition = action
        addGestureRecognizer(tapGestureRecognizer)
    }
}

// MARK: - @objc

extension TouchableView {
    /// UITapGestureRecognizer 효과를 적용하는 @objc 메서드
    @objc private func effect(_ tapGestureRecognizer: TapGestureRecognizer) {
        impactFeedbackGenerator?.impactOccurred()
        
        if tapGestureRecognizer.onTapped != nil, alpha == CGFloat(1) {
            alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { tapGestureRecognizer.onTapped?() }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in self?.alpha = 1.0 }
        }
        
        if tapGestureRecognizer.onTappedToPosition != nil, alpha == CGFloat(1) {
            alpha = 0.5
            let position = tapGestureRecognizer.location(in: self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { tapGestureRecognizer.onTappedToPosition?(position) }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in self?.alpha = 1.0 }
        }
    }
}
