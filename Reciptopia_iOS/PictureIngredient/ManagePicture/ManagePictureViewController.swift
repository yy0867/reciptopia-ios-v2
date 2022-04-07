//
//  ManagePictureViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/31.
//

import ReciptopiaUIKit

public final class ManagePictureViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: PictureIngredientViewModelProtocol
    
    // MARK: - Methods
    init(viewModel: PictureIngredientViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = ManagePictureRootView(viewModel: viewModel)
    }
}
