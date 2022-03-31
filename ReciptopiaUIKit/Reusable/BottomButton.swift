//
//  BottomButton.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/31.
//

import SnapKit

/// The subclass of `UIButton` which located in bottom of the screen.
/// Y Position will changes when keyboard appears, because it observes keyboard state.
public class BottomButton: UIButton {
    
    // MARK: - Properties
    private var isKeyboardAppears: Bool = false
    
    // MARK: - Methods
    public init(title: String, backgroundColor: UIColor = .accentColor) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20)
        setTitleColor(.white, for: .normal)
        setBackgroundColor(backgroundColor, for: .normal)
        setBackgroundColor(.gray, for: .disabled)
        observeKeyboard()
    }
    
    @available(*, unavailable, message: "init?(coder:) is called.")
    public required init?(coder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    private func observeKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if isKeyboardAppears { return }
        isKeyboardAppears = true
        
        guard let keyboardHeight =
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
            .cgRectValue.size.height else { return }
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions(), animations: {
            self.frame = CGRect(
                x: self.frame.minX,
                y: self.frame.minY - keyboardHeight,
                width: self.frame.width,
                height: self.frame.height
            )
        }, completion: nil)
    }
    
    @objc private func keyboardWillHide() {
        isKeyboardAppears = false
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions(), animations: {
            self.frame = CGRect(
                x: self.frame.minX,
                y: UIScreen.main.bounds.height - self.frame.height,
                width: self.frame.width,
                height: self.frame.height
            )
        }, completion: nil)
    }
    
    public override func didMoveToSuperview() {
        guard let _ = self.superview else {
            Log.print("superview doesn't exist.")
            return
        }
        
        self.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 13, right: 0)
    }
}
