//
//  SearchIngredientViewControllerTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/04/06.
//

import XCTest
import RxSwift
@testable import Reciptopia_iOS

class SearchIngredientViewControllerTests: XCTestCase {
    
    var viewController: SearchIngredientViewController!
    var viewModel: SearchIngredientViewModel!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        viewModel = SearchIngredientViewModel()
        viewController = SearchIngredientViewController(viewModel: viewModel)
    }

    func test_SearchIngredientViewController_searchBar_shouldAppendIngredientWhenReturnKeyClicked() {
        // Given
        var text = ""
        var receivedIngredientNames = [String]()
        
        // When
        viewModel.ingredients
            .map { $0.map { $0.name } }
            .bind(onNext: { ingredientNames in
                receivedIngredientNames = ingredientNames
            })
            .disposed(by: disposeBag)
        
        for _ in 0..<Int.random(in: 1...100) {
            text = randomString()
            viewController.searchBar.text = text
            viewController.searchBar.delegate?.searchBarSearchButtonClicked?(viewController.searchBar)
        }
        
        // Then
        XCTAssertFalse(viewModel.ingredients.value.isEmpty)
        XCTAssertEqual("", viewController.searchBar.text)
        XCTAssertEqual(viewModel.ingredients.value.map { $0.name }, receivedIngredientNames)
    }
}
