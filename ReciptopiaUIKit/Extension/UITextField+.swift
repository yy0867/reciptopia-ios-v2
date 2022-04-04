//
//  UITextField+.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/01.
//

public extension UITextField {
    
    func addDoneButton() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(dismiss)
        )
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        inputAccessoryView = toolbar
    }
    
    @objc
    private func dismiss() {
        endEditing(true)
    }
}
