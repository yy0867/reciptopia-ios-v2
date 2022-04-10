//
//  EditProfileViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/09.
//

import ReciptopiaUIKit

public final class EditProfileViewController: BaseViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Methods
    public override init() {
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = EditProfileRootView()
    }
}
