//
//  PictureIngredientViewModelTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/03/30.
//

import XCTest
import RxSwift
@testable import Reciptopia_iOS

class PictureIngredientViewModelTests: XCTestCase {

    var viewModel: PictureIngredientViewModel!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        viewModel = PictureIngredientViewModel()
    }
    
    func test_PictureIngredientViewModel_addPicture_shouldNotContainsOverMaxCount() {
        // Given
        let count = Int.random(in: 5...20)
        let maxPictureCount = viewModel.maxPictureCount
        let items = [Data](repeating: Data(), count: count)
        
        // When
        items.forEach { viewModel.addPicture(data: $0) }
        
        // Then
        if count <= maxPictureCount {
            XCTAssertEqual(viewModel.ingredientPictures.value.count, count)
        } else {
            XCTAssertEqual(viewModel.ingredientPictures.value.count, maxPictureCount)
        }
        XCTAssertLessThanOrEqual(viewModel.ingredientPictures.value.count, maxPictureCount)
    }
    
    func expectAction(
        publish: () -> Void,
        _ completion: @escaping (PictureIngredientAction) -> Void
    ) {
        viewModel.action
            .subscribe(onNext: { action in
                completion(action)
            })
            .disposed(by: disposeBag)
        
        publish()
    }
    
    
    
    func test_PictureIngredientViewModel_emitAnalyzePicture_shouldReceiveAnalyzePicture() {
        // Given
        var receivedAction: PictureIngredientAction?
        let expectation = self.expectation(description: #function)
        
        // When
        expectAction(publish: viewModel.analyzePictures) { action in
            receivedAction = action
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(receivedAction, .analyze)
    }
    
    func test_PictureIngredientViewModel_emitManagePicture_shouldReceiveManagePicture() {
        // Given
        var receivedAction: PictureIngredientAction?
        let expectation = self.expectation(description: #function)
        
        // When
        expectAction(publish: viewModel.managePictures) { action in
            receivedAction = action
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(receivedAction, .managePicture)
    }
    
    func test_PictureIngredientViewModel_emitAlbum_shouldReceiveAlbum() {
        // Given
        var receivedAction: PictureIngredientAction?
        let expectation = self.expectation(description: #function)
        
        // When
        expectAction(publish: viewModel.presentAlbum) { action in
            receivedAction = action
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(receivedAction, .album)
    }
    
    func test_PictureIngredientViewModel_emitSearch_shouldReceiveSearch() {
        // Given
        var receivedAction: PictureIngredientAction?
        let expectation = self.expectation(description: #function)
        
        // When
        expectAction(publish: viewModel.searchByName) { action in
            receivedAction = action
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(receivedAction, .search)
    }
    
    func test_PictureIngredientViewModel_emitNotification_shouldReceiveNotification() {
        // Given
        var receivedAction: PictureIngredientAction?
        let expectation = self.expectation(description: #function)
        
        // When
        expectAction(publish: viewModel.presentNotification) { action in
            receivedAction = action
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(receivedAction, .notification)
    }
}
