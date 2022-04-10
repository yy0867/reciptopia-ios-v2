//
//  MyPageNavigationController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import ReciptopiaUIKit

public class MyPageNavigationController: BaseNavigationController {
    
    public init() {
        let rootVC = MyPageViewController()
        rootVC.title = "마이페이지"
        super.init(rootVC: rootVC)
    }
}
