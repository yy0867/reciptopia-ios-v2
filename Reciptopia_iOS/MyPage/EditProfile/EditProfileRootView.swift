//
//  EditProfileRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/09.
//

import ReciptopiaUIKit
import SnapKit

final class EditProfileRootView: BaseView {
    
    // MARK: - Properties
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0.2
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var editPictureButton: UIButton = {
        let button = UIButton(
            backgroundColor: .darkGray.withAlphaComponent(0.5),
            titleColor: .white,
            title: "편집",
            font: .systemFont(ofSize: 12)
        )
        return button
    }()
    
    lazy var nicknameField: UITextField = {
        let field = UITextField()
        field.textAlignment = .center
        field.layer.borderWidth = 0.5
        field.layer.cornerRadius = 15
        field.borderStyle = .none
        field.returnKeyType = .done
        field.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return field
    }()
    
    lazy var saveButton: BottomButton = {
        let button = BottomButton(title: "저장")
        return button
    }()
    
    // MARK: - Methods
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        profileImageView.image = .defaultProfileIcon
    }
    
    override func buildHierarchy() {
        profileImageView.addSubview(editPictureButton)
        addSubview(profileImageView)
        addSubview(nicknameField)
        addSubview(saveButton)
    }
    
    override func activateConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
        }
        editPictureButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.bottom.trailing.equalToSuperview()
        }
        nicknameField.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }
}
