//
//  ProfileView.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/15.
//

import SnapKit

open class ProfileView: UIView {
    
    // MARK: - Properties
    lazy var profileStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            profileImage,
            nicknameLabel,
        ])
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        return imageView
    }()
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Methods
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(profileStack)
        profileStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func setProfileImage(_ image: UIImage?) {
        profileImage.image = image
    }
    
    public func setNickname(_ nickname: String) {
        nicknameLabel.text = nickname
    }
}
