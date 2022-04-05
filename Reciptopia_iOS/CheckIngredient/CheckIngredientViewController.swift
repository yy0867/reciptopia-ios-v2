//
//  CheckIngredientViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/01.
//

import ReciptopiaUIKit

public final class CheckIngredientViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: CheckIngredientViewModelProtocol
    
    // MARK: - Methods
    public init(viewModel: CheckIngredientViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = CheckIngredientRootView(viewModel: viewModel)
    }
}
