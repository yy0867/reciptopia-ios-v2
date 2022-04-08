//
//  CheckIngredientViewControllerTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/04/07.
//

import XCTest
@testable import Reciptopia_iOS

class CheckIngredientViewControllerTests: XCTestCase {

    var viewModel: CheckIngredientViewModelProtocol!
    var viewController: CheckIngredientViewController!
    
    override func setUp() {
        viewModel = CheckIngredientViewModel()
        viewController = CheckIngredientViewController(viewModel: viewModel)
    }
    
    func test_CheckIngredientViewController_viewDidLoad_shouldAssignViewAsCheckIngredientRootView() {
        // Given
        
        // When
        viewController.viewDidLoad()
        
        // Then
        XCTAssertTrue(viewController.view is CheckIngredientRootView)
    }
}
