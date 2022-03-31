//
//  ManagePictureRootViewTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/03/31.
//

import XCTest
@testable import Reciptopia_iOS

class ManagePictureRootViewTests: XCTestCase {
    
    var viewModel: PictureIngredientViewModel!
    var rootView: ManagePictureRootView!
    
    override func setUp() {
        viewModel = PictureIngredientViewModel()
        rootView = ManagePictureRootView(viewModel: viewModel)
    }

    func test_analyzeIngredientButton_ButtonTitle_shouldBindPictureCounts() {
        // Given
        let randomCount = Int.random(in: 0...10)
        
        // When
        for _ in 0..<randomCount { viewModel.addPicture(data: Data()) }
        
        // Then
        let title = rootView.analyzeIngredientButton.title(for: .normal)
        XCTAssertEqual(title, "\(randomCount)개의 재료 분석하기")
    }
    
    func test_analyzeIngredientButton_shouldDisabled_whenPictureIsEmpty() {
        for _ in 10..<30 {
            // Given
            let randomCount = Int.random(in: 0...3)
            viewModel.ingredientPictures.accept([])
            
            // When
            for _ in 0..<randomCount { viewModel.addPicture(data: Data()) }
            
            // Then
            XCTAssertEqual(rootView.analyzeIngredientButton.isEnabled, randomCount != 0)
        }
    }
}
