//
//  SignInRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/10.
//

import ReciptopiaUIKit
import RxCocoa
import RxSwift

final class SignInRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: SignInViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var signInWithAppIconStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            appIconImageView,
            credentialStack,
            signInAndForgetPasswordStack,
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
        let stack = UIStackView(arrangedSubviews: [emailField, passwordField])
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
        field.returnKeyType = .done
        field.isSecureTextEntry = true
        field.textContentType = .password
        field.addDoneButton()
        return field
    }()
    
    lazy var signInAndForgetPasswordStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signInButton, forgetPasswordButton])
        stack.axis = .vertical
        stack.spacing = 7
        return stack
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton(title: "로그인")
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호를 잊어 버리셨나요?", for: .normal)
        button.setTitleColor(.accentColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
    }()
    
    lazy var socialSignInStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            socialSignInLabel,
            fakeSocialSignInButton1,
            fakeSocialSignInButton2,
        ])
        stack.axis = .vertical
        stack.spacing = 7
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var socialSignInLabel: UILabel = {
        let label = UILabel()
        label.text = "소셜 로그인"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    
    lazy var fakeSocialSignInButton1: UIButton = {
        let button = UIButton(title: "Fake 1 로그인")
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var fakeSocialSignInButton2: UIButton = {
        let button = UIButton(title: "Fake 2 로그인")
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var presentSignUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    override func buildHierarchy() {
        addSubview(signInWithAppIconStack)
        addSubview(socialSignInStack)
        addSubview(presentSignUpButton)
    }
    
    override func activateConstraints() {
        signInWithAppIconStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        presentSignUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
        }
        socialSignInStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(presentSignUpButton.snp.top).offset(-40)
        }
    }
    
    override func addTargets() {
        
    }
}

// MARK: - Bind ViewModel
extension SignInRootView {
    func bindViewModel() {
        emailField.rx.text.orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)
        
        passwordField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
    }
}
