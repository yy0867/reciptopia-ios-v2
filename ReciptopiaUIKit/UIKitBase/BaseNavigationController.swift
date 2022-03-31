//
//  BaseNavigationController.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/31.
//

import UIKit

open class BaseNavigationController: UINavigationController {
    
    @available(*, unavailable, message: "init?(coder:) is called.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    @available(*, unavailable, message: "init(nibName:bundle:) is called.")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) is called.")
    }
    
    public init(rootVC: BaseViewController) {
        super.init(rootViewController: rootVC)
    }
}
