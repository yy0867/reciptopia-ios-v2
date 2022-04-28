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
    
    func registerNib(_ nibCellClass : UITableViewCell.Type) {
        let reuseIdentifier = nibCellClass.reuseIdentifier
        let nib = UINib(nibName: reuseIdentifier, bundle: Bundle(for: nibCellClass.self))
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<T>(_ CellClass: T.Type, at indexPath: IndexPath) -> T? where T: UITableViewCell {
        guard let cell = self.dequeueReusableCell(
            withIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else { return nil }
        
        return cell
    }
}
