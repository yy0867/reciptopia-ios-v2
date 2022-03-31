//
//  UICollectionView+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/31.
//

public extension UICollectionView {
    
    // MARK: - Methods
    convenience init(direction: ScrollDirection) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets.zero
        
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
    func register(_ CellClass: UICollectionViewCell.Type) {
        let reuseIdentifier = CellClass.reuseIdentifier
        self.register(CellClass.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
