//
//  CheckIngredientViewModel_IngredientCollectionViewDelegeteTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/04/04.
//

import XCTest
import RxSwift
import RxRelay
@testable import Reciptopia_iOS
@testable import ReciptopiaUIKit

class CheckIngredientViewModel_IngredientCollectionViewDelegeteTests: XCTestCase {
    
    var viewModel: CheckIngredientViewModelProtocol!
    var delegate: IngredientCollectionViewDelegate!
    var rootView: CheckIngredientRootView!
    let disposeBag = DisposeBag()

    override func setUp() {
        self.viewModel = CheckIngredientViewModel()
        self.rootView = CheckIngredientRootView(viewModel: viewModel)
        self.delegate = self.rootView
    }
    
    func randomIngredientNames() -> [String] {
        let randomCount = Int.random(in: 1...10)
        var ingredients = [String]()
        for i in 0..<randomCount { ingredients.append("ingredient \(i)") }
        return ingredients
    }
    
    // MARK: - ViewModel
    func test_CheckIngredientViewModel_addIngredient_shouldAddAndAcceptIngredients() {
        // Given
        let ingredientNames = randomIngredientNames()
        var receivedIngredientNames = [String]()
        
        // When
        viewModel.ingredients
            .map { $0.map { $0.name } }
            .subscribe(onNext: { ingredientNames in
                receivedIngredientNames = ingredientNames
            })
            .disposed(by: disposeBag)
        
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        
        // Then
        XCTAssertFalse(receivedIngredientNames.isEmpty)
        XCTAssertEqual(receivedIngredientNames.count, ingredientNames.count)
    }
    
    // MARK: - IngredientCollectionViewDelegate
    func test_IngredientCollectionViewDelegate_getName_shouldReturnIngredientNameAtIndex() {
        // Given
        let ingredientNames = randomIngredientNames()
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        
        // When
        let index = Int.random(in: 0..<ingredientNames.count)
        let nameAtIndex = viewModel.getName(at: index)
        let expectedNameAtIndex = ingredientNames[index]
        
        // Then
        XCTAssertEqual(nameAtIndex, expectedNameAtIndex)
    }
    
    
    
    func test_IngredientCollectionViewDelegate_isMainIngredient_shouldReturnFalse() {
        // Given
        let ingredientNames = randomIngredientNames()
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        
        // When
        let index = Int.random(in: 0..<ingredientNames.count)
        let isMainIngredientAtIndex = viewModel.isMainIngredient(at: index)
        
        // Then
        XCTAssertFalse(isMainIngredientAtIndex)
    }
    
    func test_IngredientCollectionViewDelegate_getCount_shouldReturnIngredientsCount() {
        // Given
        let ingredientNames = randomIngredientNames()
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        
        // When
        let ingredientsCount = viewModel.getCount()
        
        // Then
        XCTAssertEqual(ingredientNames.count, ingredientsCount)
    }
    
    func test_IngredientCollectionViewDelegate_removeAt_shouldRemoveAtIndexAndAccept() {
        // Given
        var ingredientNames = randomIngredientNames()
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        var receivedIngredientNames = [String]()
        
        // When
        viewModel.ingredients
            .map { $0.map { $0.name } }
            .subscribe(onNext: { ingredientNames in
                receivedIngredientNames = ingredientNames
            })
            .disposed(by: disposeBag)
        
        let index = Int.random(in: 0..<ingredientNames.count)
        viewModel.remove(at: index)
        ingredientNames.remove(at: index)
        
        // Then
        XCTAssertFalse(receivedIngredientNames.isEmpty)
        XCTAssertEqual(ingredientNames, receivedIngredientNames)
    }
    
    func test_IngredientCollectionViewDelegate_changeState_shouldChangeStateAndAccept() {
        // Given
        let ingredientNames = randomIngredientNames()
        ingredientNames.forEach { viewModel.addIngredient(name: $0) }
        var receivedIngredientStates = [Bool]()
        
        // When
        viewModel.ingredients
            .map { $0.map { $0.isMainIngredient } }
            .subscribe(onNext: { isMainIngrediets in
                receivedIngredientStates = isMainIngrediets
            })
            .disposed(by: disposeBag)
        
        let index = Int.random(in: 0..<ingredientNames.count)
        viewModel.changeState(isMainIngredient: true, at: index)
        
        // Then
        XCTAssertFalse(receivedIngredientStates.isEmpty)
        XCTAssertTrue(receivedIngredientStates[index])
    }
}
