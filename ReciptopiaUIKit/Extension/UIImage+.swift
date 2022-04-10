//
//  UIImage+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/06.
//

public extension UIImage {
    
    static var searchHistoryIcon: UIImage? {
        let icon = UIImage(systemName: "magnifyingglass.circle.fill")?
            .withTintColor(.searchHistoryTint, renderingMode: .alwaysOriginal)
        
        return icon
    }
    
    static var favoriteStarIcon: UIImage? {
        let icon = UIImage(systemName: "star.fill")?
            .withTintColor(.favoriteStartTint, renderingMode: .alwaysOriginal)
        
        return icon
    }
    
    static var defaultProfileIcon: UIImage? {
        return UIImage(named: "DefaultProfile")
    }
}
