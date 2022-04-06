//
//  UICollectionView+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/31.
//

public extension UICollectionView {
    
    // MARK: - Methods
    convenience init(direction: ScrollDirection, itemSpacing: CGFloat = 5) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.minimumLineSpacing = itemSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = UIEdgeInsets.zero
        
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
    func register(_ CellClass: UICollectionViewCell.Type) {
        let reuseIdentifier = CellClass.reuseIdentifier
        self.register(CellClass.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<T>(_ CellClass: T.Type, at indexPath: IndexPath) -> T? where T: UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else { return nil }
        return cell
    }
}
