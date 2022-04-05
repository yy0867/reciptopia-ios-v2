//
//  BaseView.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/29.
//

import UIKit

open class BaseView: UIView {
    
    // MARK: - Properties
    private var isAlreadyPresented = false
    
    // MARK: - Methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable, message: "init(coder:) is called.")
    public required init?(coder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    open func buildHierarchy() {}
    open func activateConstraints() {}
    open func addTargets() {}
    
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        if isAlreadyPresented { return }
        backgroundColor = (backgroundColor == nil) ? .white : backgroundColor
        configureView()
        isAlreadyPresented = true
    }
    
    public func configureView() {
        buildHierarchy()
        activateConstraints()
        addTargets()
    }
}
