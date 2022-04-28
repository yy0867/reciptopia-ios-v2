//
//  LoadableImageCell.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/27.
//

import Foundation
import SnapKit

open class LoadableImageCell: UICollectionViewCell {
    
    // MARK: - Properties
    lazy var loadableImageView: LoadableImageView = {
        let imageView = LoadableImageView()
        return imageView
    }()
    
    private var imageURL: URL? = nil
    
    // MARK: - Methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        if let url = imageURL {
            loadableImageView.fetchImage(at: url)
        }
    }
    
    private func configureView() {
        contentView.addSubview(loadableImageView)
        loadableImageView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func fetchImage(at url: URL) {
        self.imageURL = url
        loadableImageView.fetchImage(at: url)
    }
}
