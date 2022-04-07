//
//  SearchIngredientContainerView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/06.
//

import ReciptopiaUIKit

final class SearchIngredientContainerView: ContainerView {
    
    // MARK: - Properties
    let searchIngredientViewModelInput: SearchIngredientViewModelInput
    
    lazy var historyAndFavoriteView: HistoryAndFavoriteRootView = {
        let view = HistoryAndFavoriteRootView(searchIngredientViewModelInput: searchIngredientViewModelInput)
        return view
    }()
    
    lazy var postSearchListView: PostSearchListView = {
        let view = PostSearchListView()
        return view
    }()
    
    // MARK: - Methods
    init(searchIngredientViewModelInput: SearchIngredientViewModelInput) {
        self.searchIngredientViewModelInput = searchIngredientViewModelInput
        super.init(frame: .zero)
        setSubviewList([historyAndFavoriteView, postSearchListView])
        presentSubview(at: 0)
    }
}
