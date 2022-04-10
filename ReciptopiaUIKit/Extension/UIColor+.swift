//
//  UIColor+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/30.
//

import UIKit

public extension UIColor {
    
    // MARK: - Properties
    static let accentColor = UIColor(0x5F8FED)
    static let mainIngredient = UIColor(0xEDAE0C)
    static let brightGray = UIColor(0xE5E5E5)
    static let searchHistoryTint = UIColor(0xBEBEF0)
    static let favoriteStartTint = UIColor(0xEFDD3F)
    static let editProfileButtonBackground = UIColor(0xF9F9F9)
    
    // MARK: - Methods
    convenience init(_ hex: Int) {
        guard 0...0xFFFFFF ~= hex else {
            fatalError("the given value \(hex) is not RGB values.")
        }
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
