//
//  PictureIngredientRootViewTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/03/30.
//

import XCTest
@testable import Reciptopia_iOS

class PictureIngredientRootViewTests: XCTestCase {
    
    var rootView: PictureIngredientRootView!
    var viewModel: PictureIngredientViewModel!
    
    override func setUp() {
        viewModel = PictureIngredientViewModel()
        rootView = PictureIngredientRootView(viewModel: viewModel)
        rootView.didMoveToWindow()
    }
    
    func test_MaskingStack_ButtonLabels_shouldBindPictureCounts() {
        // Given
        let randomCount = Int.random(in: 0...10)
        
        // When
        
        for _ in 0..<randomCount { viewModel.addPicture(data: Data()) }
        
        // Then
        DispatchQueue.main.async {
            XCTAssertEqual(
                self.rootView.managePictureButton.title(for: .normal),
                "\(randomCount) / \(self.viewModel.maxPictureCount)"
            )
            XCTAssertEqual(
                self.rootView.analyzePictureButton.title(for: .normal),
                "\(randomCount)개의 재료 분석하기"
            )
        }
    }
    
    func test_MaskingStack_Buttons_shouldUnabled_whenPictureIsEmpty() {
        // Given
        
        // When
        viewModel.ingredientPictures.accept([])
        
        // Then
        DispatchQueue.main.async {
            XCTAssertFalse(self.rootView.managePictureButton.isEnabled)
            XCTAssertFalse(self.rootView.analyzePictureButton.isEnabled)
        }
    }
    
    func test_MaskingStack_Buttons_shouldEnabled_whenPictureIsNotEmpty() {
        // Given
        let randomCount = Int.random(in: 1...10)
        
        // When
        for _ in 1...randomCount { viewModel.addPicture(data: Data()) }
        
        // Then
        XCTAssertTrue(rootView.managePictureButton.isEnabled)
        XCTAssertTrue(rootView.analyzePictureButton.isEnabled)
    }
    
    func test_PhotoUtilStack_Buttons_shouldDisabled_whenPictureIsFull() {
        // Given
        
        // When
        for _ in 1...viewModel.maxPictureCount {
            viewModel.addPicture(data: Data())
        }
        
        // Then
        DispatchQueue.main.async {
            XCTAssertFalse(self.rootView.presentPhotoAlbumButton.isEnabled)
            XCTAssertFalse(self.rootView.takePhotoButton.isEnabled)
        }
    }
    
    func test_PhotoUtilStack_Buttons_shouldEnabled_whenPictureIsNotFull() {
        // Given
        let randomCount = Int.random(in: 0..<viewModel.maxPictureCount)
        
        // When
        for _ in 0..<randomCount { viewModel.addPicture(data: Data()) }
        
        // Then
        DispatchQueue.main.async {
            XCTAssertTrue(self.rootView.presentPhotoAlbumButton.isEnabled)
            XCTAssertTrue(self.rootView.takePhotoButton.isEnabled)
        }
    }
}
