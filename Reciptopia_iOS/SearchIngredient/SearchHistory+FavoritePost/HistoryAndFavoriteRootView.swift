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
    
    lazy var searchFloatingButton: FloatingButton = {
        let button = FloatingButton(size: 50)
        button.setImage(UIImage(systemName: "magnifyingglass"))
        return button
    }()
    
    // MARK: - Methods
    override func buildHierarchy() {
        addSubview(pageSegment)
        addSubview(historyAndFavoriteContainerView)
        addSubview(searchFloatingButton)
    }
    
    override func activateConstraints() {
        pageSegment.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(45)
        }
        searchFloatingButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(30)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
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
