//
//  LoadableImageCollectionView.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/27.
//

import Foundation

public class LoadableImageCollectionView: UICollectionView {
    
    // MARK: - Properties
    private var imageURLs: [String] = []
    private var cellSize: CGFloat = 140
    
    // MARK: - Methods
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        self.register(LoadableImageCell.self)
        self.delegate = self
        self.dataSource = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    public func setImageURLs(_ urls: [String]) {
        self.imageURLs = urls
        self.reloadData()
    }
    
    public func setCellSize(_ size: CGFloat) {
        self.cellSize = size
    }
}

extension LoadableImageCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
}

extension LoadableImageCollectionView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(LoadableImageCell.self, at: indexPath) else {
            return UICollectionViewCell()
        }
        
        if let url = URL(string: imageURLs[indexPath.item]) {
            cell.fetchImage(at: url)
        }
        
        return cell
    }
}
