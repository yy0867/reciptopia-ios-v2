//
//  SearchIngredientRootViewTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/04/06.
//

import XCTest
import RxSwift
@testable import Reciptopia_iOS
@testable import ReciptopiaUIKit

class SearchIngredientRootViewTests: XCTestCase {
    
    var viewModel: SearchIngredientViewModelProtocol!
    var rootView: SearchIngredientRootView!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        viewModel = SearchIngredientViewModel()
        rootView = SearchIngredientRootView(viewModel: viewModel)
    }
    
    func test_SearchIngredientRootView_addIngredient_shouldAddCollectionViewCell() {
        // Given
        let randomCount = Int.random(in: 10...50)
        
        // When
        for _ in 0..<randomCount { viewModel.addIngredient(name: randomString()) }
        
        // Then
        let collectionViewCellCount = rootView.ingredientCollectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(randomCount, collectionViewCellCount)
    }
    
    func test_SearchIngredientRootView_removeIngredient_shouldRemoveCollectionViewCell() {
        // Given
        let randomCount = Int.random(in: 10...50)
        var receivedIngredientNames = [String]()
        var ingredientNameSource = [String]()
        for _ in 0..<randomCount {
            let name = randomString()
            viewModel.addIngredient(name: name)
            ingredientNameSource.append(name)
        }
        
        // When
        viewModel.ingredients
            .map { $0.map { $0.name } }
            .bind(onNext: { ingredientNames in
                receivedIngredientNames = ingredientNames
            })
            .disposed(by: disposeBag)
        
        let randomAmount = Int.random(in: 1..<randomCount)
        for i in stride(from: randomAmount, to: 0, by: -1) {
            rootView.remove(at: i)
            ingredientNameSource.remove(at: i)
        }
        
        // Then
        XCTAssertEqual(receivedIngredientNames, ingredientNameSource)
    }
    
    func test_SearchIngredientRootView_changeStateAtIndex_shouldChangeCellAtIndexColor() {
        // Given
        let randomCount = Int.random(in: 10...50)
        for _ in 0..<randomCount { viewModel.addIngredient(name: randomString()) }
        
        // When
        let index = Int.random(in: 0..<randomCount)
        rootView.changeState(to: .mainIngredient, at: index)
        
        // Then
        let indexPath = IndexPath(item: index, section: 0)
        guard let cell = rootView.ingredientCollectionView.dataSource?.collectionView(
            rootView.ingredientCollectionView,
            cellForItemAt: indexPath
        ) as? IngredientCell else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(UIColor.mainIngredient, cell.backgroundColor)
    }
}
