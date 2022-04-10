//
//  ProfileCell.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import ReciptopiaUIKit

class ProfileCell: UITableViewCell {
    
    // MARK: - Properties
    lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileAndUserInfoStack, editProfileButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var profileAndUserInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileImageView, userInfoStack])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var userInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nicknameLabel, emailLabel])
        stack.axis = .vertical
        stack.spacing = 7
        stack.alignment = .fill
        return stack
    }()
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var editProfileButton: UIButton = {
        let button = UIButton(
            backgroundColor: .editProfileBackground,
            titleColor: .black,
            title: "프로필 편집",
            font: .systemFont(ofSize: 13)
        )
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    var editButtonHandler: () -> Void = {}
    
    // MARK: - Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    func configureCell(setting: MyPageSetting) {
        profileImageView.image = setting.icon
        nicknameLabel.text = setting.title
        emailLabel.text = setting.subTitle
        editButtonHandler = setting.handler
    }
    
    private func addTargets() {
        editProfileButton.addTarget(
            self,
            action: #selector(editButtonClicked),
            for: .touchUpInside
        )
    }
    
    @objc
    func editButtonClicked() {
        editButtonHandler()
    }
}
