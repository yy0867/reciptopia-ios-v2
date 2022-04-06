//
//  ContainerView.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/05.
//

import SnapKit

open class ContainerView: BaseView {
    
    private var subview = BaseView()
    
    // MARK: - Properties
    public private(set) var subviewList = [BaseView]()
    public private(set) var presentedSubview: BaseView? {
        didSet {
            guard let subview = presentedSubview else {
                Log.print("presentedSubview is nil.")
                return
            }
            presentSubview(subview)
        }
    }
    
    // MARK: - Methods
    open override func buildHierarchy() {
        addSubview(subview)
    }
    
    open override func activateConstraints() {
        subview.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    public func setSubviewList(_ subviewList: [BaseView]) {
        self.subviewList = subviewList
        presentSubview(at: 0)
    }
    
    public func addSubviewList(_ subview: BaseView) {
        self.subviewList.append(subview)
    }
    
    public func presentSubview(at index: Int) {
        self.presentedSubview = subviewList[index]
    }
    
    private func presentSubview(_ subview: BaseView) {
        self.subview.removeFromSuperview()
        self.subview = subview
        addSubview(self.subview)
        self.subview.snp.remakeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
}
