//
//  SelectableImageCell.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/31.
//

import SnapKit

public class SelectableImageCell: UICollectionViewCell {
    
    // MARK: - Properties    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var selectedView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .accentColor
        imageView.backgroundColor = .white
        imageView.isHidden = true
        if let height = imageView.image?.size.height {
            imageView.layer.cornerRadius = height / 2
        }
        return imageView
    }()
    
    // MARK: - Methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    @available(*, unavailable, message: "init?(coder:) is called.")
    public required init?(coder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    private func configureView() {
        backgroundColor = .lightGray
        
        addSubview(imageView)
        imageView.addSubview(selectedView)
        
        imageView.snp.makeConstraints { $0.top.leading.bottom.trailing.equalToSuperview() }
        selectedView.snp.makeConstraints { $0.bottom.trailing.equalToSuperview().inset(15) }
    }
    
    public func setImage(_ image: UIImage?) {
        imageView.image = image
    }
    
    public func selectCell() { selectedView.isHidden = false }
    
    public func deselectCell() { selectedView.isHidden = true }
}
