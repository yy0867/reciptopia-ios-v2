//
//  UITableView+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/06.
//

import Foundation

public extension UITableView {
    
    func register(_ cellClass: UITableViewCell.Type) {
        let reuseIdentifier = cellClass.reuseIdentifier
        register(cellClass.self, forCellReuseIdentifier: reuseIdentifier)
    }
}
