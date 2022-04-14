//
//  SignUpViewModel.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/10.
//

import Foundation
import RxRelay
import RxSwift

public protocol SignUpViewModelInput {
    var email: BehaviorRelay<String> { get }
    var password: BehaviorRelay<String> { get }
    var checkPassword: BehaviorRelay<String> { get }
    var nickname: BehaviorRelay<String> { get }
}

public protocol SignUpViewModelOutput {
    var isAllFieldValid: Observable<Bool> { get }
}

public protocol SignUpViewModelProtocol:
    SignUpViewModelInput,
    SignUpViewModelOutput {}

public final class SignUpViewModel: SignUpViewModelProtocol {
    
    // MARK: - Properties
    public let email = BehaviorRelay<String>(value: "")
    public let password = BehaviorRelay<String>(value: "")
    public let checkPassword = BehaviorRelay<String>(value: "")
    public let nickname = BehaviorRelay<String>(value: "")
    
    public var isAllFieldValid: Observable<Bool> {
        .combineLatest(
            email,
            password,
            checkPassword,
            nickname
        ) { (email, password, checkPassword, nickname) in
            if email.isEmpty || password.isEmpty || checkPassword.isEmpty || nickname.isEmpty {
                return false
            }
            if password != checkPassword { return false }
            return true
        }
    }
    
    // MARK: - Methods
    public init() {
        
    }
}
