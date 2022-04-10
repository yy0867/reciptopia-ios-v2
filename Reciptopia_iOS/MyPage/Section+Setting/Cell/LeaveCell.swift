//
//  SignOutCell.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import ReciptopiaUIKit

class LeaveCell: UITableViewCell {
    
    // MARK: - Properties
    
    
    // MARK: - Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) is called.")
    }
    
    func configureCell(setting: MyPageSetting) {
        textLabel?.text = setting.title
        textLabel?.textColor = .systemRed
    }
}
