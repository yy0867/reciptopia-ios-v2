//
//  UITableViewCell+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/06.
//

import Foundation

public extension UITableViewCell {
    
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
    
    func setImage(_ image: UIImage?) {
        self.imageView?.image = image
    }
    
    func setTitle(_ title: String) {
        self.textLabel?.text = title
    }
}
