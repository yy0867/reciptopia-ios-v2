//
//  FavoriteButton.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/27.
//

import UIKit

open class FavoriteButton: UIButton {
    
    // MARK: - Properties
    
    // MARK: - Methods
    public init() {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)))
        self.setImage(.selectedFavoriteStarIcon, for: .selected)
        self.setImage(.unselectedFavoriteStarIcon, for: .normal)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func favoriteOn() {
        self.isSelected = true
    }
    
    public func favoriteOff() {
        self.isSelected = false
    }
}
