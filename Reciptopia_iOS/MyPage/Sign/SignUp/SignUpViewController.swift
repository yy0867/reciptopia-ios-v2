//
//  SignUpViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/10.
//

import ReciptopiaUIKit

public final class SignUpViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: SignUpViewModelProtocol
    
    // MARK: - Methods
    public init(viewModel: SignUpViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        view = SignUpRootView(viewModel: viewModel)
    }
}
