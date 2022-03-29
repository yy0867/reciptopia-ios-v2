//
//  UIButton+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/30.
//

import UIKit

// MARK: - Background and Title
public extension UIButton {
    
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
    }
}
