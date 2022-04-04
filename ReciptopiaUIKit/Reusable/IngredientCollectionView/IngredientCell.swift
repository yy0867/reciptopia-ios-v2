//
//  IngredientCell.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/01.
//

import SnapKit

public final class IngredientCell: UICollectionViewCell {
    public enum State {
        case subIngredient
        case mainIngredient
    }
    
    // MARK: - Properties
    public var removeHandler: (() -> Void)? = nil
    
    public lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, removeButton])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let removeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.widthAnchor.constraint(equalToConstant: 12).isActive = true
        button.heightAnchor.constraint(equalToConstant: 12).isActive = true
        return button
    }()
    
    private var _ingredientState: State = .subIngredient
    public private(set) var ingredientState: State {
        get { _ingredientState }
        set {
            _ingredientState = newValue
            switch _ingredientState {
                case .mainIngredient: self.backgroundColor = .mainIngredient
                case .subIngredient: self.backgroundColor = .accentColor
            }
        }
    }
    
    // MARK: - Methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addTargets()
    }
    
    @available(*, unavailable, message: "init?(coder:) is called.")
    public required init?(coder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    private func configureUI() {
        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.centerY.equalToSuperview()
            make.height.equalTo(30).priority(.medium)
        }
        layer.cornerRadius = self.frame.height / 2
    }
    
    private func addTargets() {
        removeButton.addTarget(
            self,
            action: #selector(removeCell),
            for: .touchUpInside
        )
    }
    
    @objc
    private func removeCell() {
        removeHandler?()
    }
    
    public func configureCell(ingredientName: String, state: State, removeHandler: @escaping () -> Void) {
        nameLabel.text = ingredientName
        ingredientState = state
        self.removeHandler = removeHandler
    }
    
    public func toggleState() {
        if ingredientState == .subIngredient {
            ingredientState = .mainIngredient
        } else {
            ingredientState = .subIngredient
        }
    }
}
