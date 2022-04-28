//
//  SearchIngredientContainerView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/06.
//

import ReciptopiaUIKit
import ReciptopiaKit
import RxSwift
import RxCocoa

final class SearchIngredientContainerView: ContainerView {
    
    enum View: Int {
        case historyAndFavorite = 0
        case postSearchList = 1
    }
    
    // MARK: - Properties
    let searchIngredientViewModelAction: SearchIngredientViewModelAction
    let disposeBag = DisposeBag()
    
    lazy var historyAndFavoriteView: HistoryAndFavoriteRootView = {
        let view = HistoryAndFavoriteRootView(searchIngredientViewModelAction: searchIngredientViewModelAction)
        return view
    }()
    
    lazy var postSearchListView: PostSearchResultRootView = {
        let viewModel = PostSearchResultViewModel()
        let view = PostSearchResultRootView(viewModel: viewModel)
        return view
    }()
    
    // MARK: - Methods
    init(searchIngredientViewModelAction: SearchIngredientViewModelAction) {
        self.searchIngredientViewModelAction = searchIngredientViewModelAction
        super.init(frame: .zero)
        setSubviewList([historyAndFavoriteView, postSearchListView])
        presentSubview(at: View.historyAndFavorite.rawValue)
        observeViewModelAction()
    }
    
    private func observeViewModelAction() {
        searchIngredientViewModelAction.searchPublisher
            .bind(onNext: { [weak self] ingredients in
                self?.presentPostSearchListView(ingredients: ingredients)
            })
            .disposed(by: disposeBag)
        
        searchIngredientViewModelAction.searchBarStartEditing
            .bind(onNext: { [weak self] _ in
                self?.presentSubview(at: View.historyAndFavorite.rawValue)
            })
            .disposed(by: disposeBag)
    }
    
    private func presentPostSearchListView(ingredients: [Ingredient]) {
        postSearchListView.fetchPost(by: ingredients)
        presentSubview(at: View.postSearchList.rawValue)
    }
}
