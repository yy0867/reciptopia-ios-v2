//
//  SignInViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/10.
//

import ReciptopiaUIKit
import RxSwift
import RxCocoa

public final class SignInViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: SignInViewModelProtocol
    let disposeBag = DisposeBag()
    
    // MARK: - Methods
    public init(viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        observeViewModel()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = SignInRootView(viewModel: viewModel)
    }
    
    private func observeViewModel() {
        viewModel.action
            .bind(onNext: { [weak self] action in
                switch action {
                    case .signUp: self?.presentSignUp()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func presentSignUp() {
        let vm = SignUpViewModel()
        let signUpViewController = SignUpViewController(viewModel: vm)
        signUpViewController.title = "회원가입"
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
}
