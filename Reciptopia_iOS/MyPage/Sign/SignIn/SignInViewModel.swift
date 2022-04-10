//
//  SignInViewModel.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/10.
//

import Foundation
import RxRelay

public protocol SignInViewModelInput {
    func signIn()
    func presentForgetPassword()
    func presentSignUp()
}

public protocol SignInViewModelOutput {
    var email: BehaviorRelay<String> { get }
    var password: BehaviorRelay<String> { get }
}

public protocol SignInViewModelProtocol:
    SignInViewModelInput,
    SignInViewModelOutput {}

public final class SignInViewModel: SignInViewModelProtocol {
    
    // MARK: - Properties
    public let email = BehaviorRelay<String>(value: "")
    public let password = BehaviorRelay<String>(value: "")
    
    // MARK: - Methods
    public func signIn() {
        
    }
    
    public func presentSignUp() {
        
    }
    
    public func presentForgetPassword() {
        
    }
}
