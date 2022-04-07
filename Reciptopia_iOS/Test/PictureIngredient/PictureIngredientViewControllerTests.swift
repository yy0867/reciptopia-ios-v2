//
//  PictureIngredientViewControllerTests.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/31.
//

import XCTest
@testable import Reciptopia_iOS

class PictureIngredientViewControllerTests: XCTestCase {
    
    var pictureIngredientNavigationController: PictureIngredientNavigationController!
    var viewModel: PictureIngredientViewModel!
    var pictureIngredientViewController: PictureIngredientViewController!
    
    override func setUp() {
        viewModel = PictureIngredientViewModel()
        pictureIngredientNavigationController = PictureIngredientNavigationController(
            viewModel: viewModel
        )
        guard let pictureIngredientViewController =
                pictureIngredientNavigationController.topViewController
                as? PictureIngredientViewController else {
            XCTFail("\(#function) - get view controller from navigation controller fails.")
            return
        }
        self.pictureIngredientViewController = pictureIngredientViewController
        self.pictureIngredientViewController.viewDidLoad()
    }
    
    func test_PictureIngredientViewController_titleItem_shouldBeSearchButton() {
        // Given
        guard let titleItem = pictureIngredientViewController.navigationItem.titleView as? UIButton else {
            XCTFail("title item is not a UIButton.")
            return
        }
        
        // When
        let title = titleItem.title(for: .normal)
        let image = titleItem.image(for: .normal)
        
        // Then
        XCTAssertEqual(title, "이름으로 검색")
        XCTAssertEqual(UIImage(systemName: "magnifyingglass"), image)
    }
    
    func test_PictureIngredientViewController_rightBarButtonItem_shouldBeNotificationButton() {
        // Given
        guard let rightItem = pictureIngredientViewController.navigationItem.rightBarButtonItem else {
            XCTFail("right bar button item is nil.")
            return
        }
        
        // When
        let image = rightItem.image
        
        // Then
        XCTAssertEqual(UIImage(systemName: "bell.fill"), image)
    }
    
    func test_PictureIngredientViewController_observeViewModel_shouldReceiveCorrectAction() {
        // Given
        
        // When
        
        // Then
    }
}
