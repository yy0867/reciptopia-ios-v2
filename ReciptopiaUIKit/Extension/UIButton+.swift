//
//  UIButton+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/30.
//

import UIKit

public extension UIButton {
    
    // MARK: - Properties
    
    // MARK: - Methods
    convenience init(
        backgroundColor: UIColor = .accentColor,
        titleColor: UIColor = .white,
        title: String,
        font: UIFont = .systemFont(ofSize: 16)
    ) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.layer.masksToBounds = true
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
