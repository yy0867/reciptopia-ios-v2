//
//  PictureIngredientNavigationController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/31.
//

import ReciptopiaUIKit

public final class PictureIngredientNavigationController: BaseNavigationController {
    
    // MARK: - Properties
    
    // MARK: - Methods
    public init(viewModel: PictureIngredientViewModel) {
        let rootVC = PictureIngredientViewController(viewModel: viewModel)
        super.init(rootVC: rootVC)
    }
}
