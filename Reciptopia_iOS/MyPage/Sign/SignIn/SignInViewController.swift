//
//  SignInViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/10.
//

import ReciptopiaUIKit

public final class SignInViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: SignInViewModel
    
    // MARK: - Methods
    public init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = SignInRootView(viewModel: viewModel)
    }
}
