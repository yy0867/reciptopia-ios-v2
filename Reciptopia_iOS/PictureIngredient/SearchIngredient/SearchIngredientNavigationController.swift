//
//  SearchIngredientNavigationController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import ReciptopiaUIKit

public final class SearchIngredientNavigationController: BaseNavigationController {
    
    // MARK: - Properties
    
    // MARK: - Methods
    public init(viewModel: SearchIngredientViewModelProtocol) {
        let rootVC = SearchIngredientViewController(viewModel: viewModel)
        super.init(rootVC: rootVC)
    }
}

