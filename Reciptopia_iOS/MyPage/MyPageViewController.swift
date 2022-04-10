//
//  MyPageViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import ReciptopiaUIKit

final class MyPageViewController: BaseViewController {
    
    // MARK: - Properties
    let sectionManager = MyPageSectionManager()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MyPageRootView(sectionManager: sectionManager)
    }
}
