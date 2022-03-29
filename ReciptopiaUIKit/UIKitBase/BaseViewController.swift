//
//  BaseViewController.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/29.
//

import UIKit

open class BaseViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "init?(coder:) is called.")
    public required init?(coder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    @available(*, unavailable, message: "init(nibName:bundle:) is called.")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) is called.")
    }
}
