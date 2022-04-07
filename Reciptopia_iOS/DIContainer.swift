//
//  DIContainer.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/07.
//

import Foundation

public class DIContainer {
    
    public init() {
        
    }
    
    public func makePictureIngredientViewController() -> PictureIngredientNavigationController {
        let vm = PictureIngredientViewModel()
        let nc = PictureIngredientNavigationController(viewModel: vm)
        
        return nc
    }
    
    public func makeManagePictureViewController() -> ManagePictureViewController {
        let vm = PictureIngredientViewModel()
        return ManagePictureViewController(viewModel: vm)
    }
    
    public func makeSearchIngredientNavigationController() -> SearchIngredientNavigationController {
        let vm = SearchIngredientViewModel()
        return SearchIngredientNavigationController(viewModel: vm)
    }
}
