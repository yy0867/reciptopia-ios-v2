//
//  SignUpRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/10.
//

import ReciptopiaUIKit
import RxCocoa
import RxSwift

final class SignUpRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: SignUpViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var signUpWithAppIconStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            appIconImageView,
            credentialStack,
            signUpButton,
        ])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 15
        return stack
    }()
    
    lazy var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .appIcon
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    lazy var credentialStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            emailField,
            passwordField,
            checkPasswordField,
            nicknameField,
        ])
        stack.axis = .vertical
        stack.spacing = 7
        return stack
    }()
    
    lazy var emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "이메일"
        field.heightAnchor.constraint(equalToConstant: 34).isActive = true
        field.borderStyle = .roundedRect
        field.returnKeyType = .next
        field.keyboardType = .emailAddress
        field.textContentType = .emailAddress
        field.addDoneButton()
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "비밀번호"
        field.heightAnchor.constraint(equalToConstant: 34).isActive = true
        field.borderStyle = .roundedRect
        field.returnKeyType = .next
        field.textContentType = .password
        field.isSecureTextEntry = true
        field.addDoneButton()
        return field
    }()
    
    lazy var checkPasswordField: UITextField = {
        let field = UITextField()
        field.placeholder = "비밀번호 확인"
        field.heightAnchor.constraint(equalToConstant: 34).isActive = true
        field.borderStyle = .roundedRect
        field.returnKeyType = .next
        field.isSecureTextEntry = true
        field.textContentType = .password
        field.addDoneButton()
        return field
    }()
    
    lazy var nicknameField: UITextField = {
        let field = UITextField()
        field.placeholder = "닉네임"
        field.heightAnchor.constraint(equalToConstant: 34).isActive = true
        field.borderStyle = .roundedRect
        field.returnKeyType = .done
        field.textContentType = .nickname
        field.addDoneButton()
        return field
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(title: "회원가입")
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var socialSignUpStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            socialSignUpLabel,
            fakeSocialSignUp1,
            fakeSocialSignUp2,
        ])
        stack.axis = .vertical
        stack.spacing = 7
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var socialSignUpLabel: UILabel = {
        let label = UILabel()
        label.text = "소셜 회원가입"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    
    lazy var fakeSocialSignUp1: UIButton = {
        let button = UIButton(title: "Fake 회원가입 1")
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var fakeSocialSignUp2: UIButton = {
        let button = UIButton(title: "Fake 회원가입 2")
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: SignUpViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    override func buildHierarchy() {
        addSubview(signUpWithAppIconStack)
        addSubview(socialSignUpStack)
    }
    
    override func activateConstraints() {
        signUpWithAppIconStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        socialSignUpStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-30)
        }
    }
}

// MARK: - Bind ViewModel
extension SignUpRootView {
    func bindViewModel() {
        bindFieldsToViewModel()
        bindViewModelToButtons()
    }
    
    private func bindFieldsToViewModel() {
        emailField.rx.text.orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)
        
        passwordField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        
        checkPasswordField.rx.text.orEmpty
            .bind(to: viewModel.checkPassword)
            .disposed(by: disposeBag)
        
        nicknameField.rx.text.orEmpty
            .bind(to: viewModel.nickname)
            .disposed(by: disposeBag)
    }
    
    private func bindViewModelToButtons() {
        viewModel.isAllFieldValid
            .bind(to: signUpButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
