//
//  CapsuleField.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/01.
//

public final class CapsuleField: UITextField {
    
    // MARK: - Methods
    public convenience init(height: CGFloat) {
        self.init(frame: .zero)
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        configureBorder(cornerRadius: height / 2)
        addLeftPadding(padding: height / 3)
    }
    
    private func configureBorder(cornerRadius: CGFloat) {
        self.layer.borderColor = UIColor.accentColor.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = cornerRadius
    }
    
    private func addLeftPadding(padding: CGFloat) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: padding))
        self.leftView = leftView
        self.leftViewMode = .always
    }
}
