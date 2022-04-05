//
//  CheckIngredientRootViewTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/04/03.
//

import XCTest
import RxSwift
@testable import Reciptopia_iOS
@testable import ReciptopiaUIKit

class CheckIngredientRootViewTests: XCTestCase {
    
    var viewModel: CheckIngredientViewModel!
    var rootView: CheckIngredientRootView!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        self.viewModel = CheckIngredientViewModel()
        self.rootView = CheckIngredientRootView(viewModel: viewModel)
    }
    
    func getRandomIngredientNames() -> [String] {
        let randomCount = Int.random(in: 3...10)
        var ingredients = [String]()
        for i in 0..<randomCount { ingredients.append("ingredient \(i)") }
        return ingredients
    }

    func test_CheckIngredientRootView_addIngredient_shouldAddItemInIngredientCollectionView() {
        // Given
        let ingredientNames = getRandomIngredientNames()
        
        // When
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        
        // Then
        let ingredientCount = rootView.ingredientCollectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(ingredientCount, ingredientNames.count)
    }
    
    func test_CheckIngredientRootView_remoteAt_shouldRemoveItemInIngredientCollectionView() {
        // Given
        let ingredientNames = getRandomIngredientNames()
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        
        // When
        let removeCount = Int.random(in: 1..<ingredientNames.count)
        for i in 1...removeCount {
            viewModel.remove(at: ingredientNames.count - i)
        }
        
        // Then
        let ingredientCount = rootView.ingredientCollectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(ingredientCount, ingredientNames.count - removeCount)
    }
    
    func test_CheckIngredientRootView_textFieldShouldReturn_shouldAddIngredientAndClearTextAndEndEditing() {
        // Given
        let text = randomString(randomLength: 5..<10)
        let addIngredientField = rootView.addIngredientField
        addIngredientField.text = text
        var receivedIngredientNames = [String]()
        
        // When
        viewModel.ingredients
            .map { $0.map { $0.name } }
            .subscribe(onNext: { ingredientNames in
                receivedIngredientNames = ingredientNames
            })
            .disposed(by: disposeBag)
        
        let _ = addIngredientField.delegate?.textFieldShouldReturn?(addIngredientField)
        // Then
        XCTAssertFalse(receivedIngredientNames.isEmpty)
        XCTAssertTrue(addIngredientField.text!.isEmpty)
        XCTAssertFalse(addIngredientField.isEditing)
    }
}
