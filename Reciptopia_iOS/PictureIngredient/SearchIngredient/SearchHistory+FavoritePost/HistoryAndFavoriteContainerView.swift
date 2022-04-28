//
//  HistoryAndFavoriteContainerView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/06.
//

import ReciptopiaUIKit

final class HistoryAndFavoriteContainerView: ContainerView {
    
    // MARK: - Properties
    lazy var searchHistoryView: SearchHistoryRootView = {
        let viewModel = SearchHistoryViewModel()
        let view = SearchHistoryRootView(viewModel: viewModel)
        return view
    }()
    
    lazy var favoritePostView: FavoritePostRootView = {
        let viewModel = FavoritePostViewModel()
        let view = FavoritePostRootView(viewModel: viewModel)
        return view
    }()
    
    // MARK: - Methods
    init() {
        super.init(frame: .zero)
        setSubviewList([searchHistoryView, favoritePostView])
        presentSubview(at: 0)
    }
}
