//
//  UICollectionViewCell+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/31.
//

import Foundation

public extension UICollectionViewCell {
    
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
