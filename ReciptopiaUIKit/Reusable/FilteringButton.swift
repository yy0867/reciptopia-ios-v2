//
//  FilteringButton.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/14.
//

open class FilteringButton: UIButton {
    
    var actions = [UIAction]()
    
    public init(frame: CGRect = .zero, title: String, actions: [UIAction]) {
        super.init(frame: frame)
        self.actions = actions
        self.setTitle(title, for: .normal)
        self.setImage(.filteringImage, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 13)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil) { actions in
                return UIMenu(title: "", children: actions)
            }
    }
}
