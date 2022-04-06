//
//  HistoryAndFavoriteContainerView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import ReciptopiaUIKit

final class HistoryAndFavoriteRootView: BaseView {
    
    // MARK: - Properties
    lazy var pageSegment: PageSegmentedControl = {
        let segmentedControl = PageSegmentedControl()
        segmentedControl.insertSegment(withTitle: "검색 기록", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "즐겨찾기", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    lazy var historyAndFavoriteContainerView: HistoryAndFavoriteContainerView = {
        let containerView = HistoryAndFavoriteContainerView()
        return containerView
    }()
    
    // MARK: - Methods
    override func buildHierarchy() {
        addSubview(pageSegment)
        addSubview(historyAndFavoriteContainerView)
    }
    
    override func activateConstraints() {
        pageSegment.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(45)
        }
        historyAndFavoriteContainerView.snp.makeConstraints { make in
            make.top.equalTo(pageSegment.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    override func addTargets() {
        pageSegment.addTarget(
            self,
            action: #selector(pageSelected),
            for: .valueChanged
        )
    }
    
    @objc
    func pageSelected(_ pageSegment: PageSegmentedControl) {
        historyAndFavoriteContainerView.presentSubview(at: pageSegment.selectedSegmentIndex)
    }
}
