//
//  HistoryAndFavoriteRootViewTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/04/07.
//

import XCTest
@testable import Reciptopia_iOS

class HistoryAndFavoriteRootViewTests: XCTestCase {
    
    var rootView: HistoryAndFavoriteRootView!
    
    class FakeSearchIngredientViewModelAction: SearchIngredientViewModelAction {
        func searchButtonClicked() {
            
        }
    }

    override func setUp() {
        let action = FakeSearchIngredientViewModelAction()
        rootView = HistoryAndFavoriteRootView(searchIngredientViewModelAction: action)
    }
    
    func test_HistoryAndFavoriteRootView_selectSearchHistory_shouldPresentSearchHistoryRootView() {
        // Given
        rootView.pageSegment.selectedSegmentIndex = 0
        
        // When
        rootView.pageSelected(rootView.pageSegment)
        
        // Then
        XCTAssertTrue(rootView.historyAndFavoriteContainerView.presentedSubview is SearchHistoryRootView)
    }
    
    func test_HistoryAndFavoriteRootView_selectFavoritePost_shouldPresentFavoritePostRootView() {
        // Given
        rootView.pageSegment.selectedSegmentIndex = 1
        
        // When
        rootView.pageSelected(rootView.pageSegment)
        
        // Then
        XCTAssertTrue(rootView.historyAndFavoriteContainerView.presentedSubview is FavoritePostRootView)
    }
    
    func test_HistoryAndFavoriteRootView_clickSearchFloatingButton_shouldClearIngredients() {
        // Given
        let viewModel = SearchIngredientViewModel()
        let rootView = HistoryAndFavoriteRootView(searchIngredientViewModelAction: viewModel)
        
        // When
        rootView.searchButtonClicked()
        
        // Then
        XCTAssertTrue(viewModel.ingredients.value.isEmpty)
    }
}
