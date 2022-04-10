//
//  DeleteAccountSetting.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import UIKit

struct DeleteAccountSetting: MyPageSetting {
    var type: MyPageSettingType = .leave
    var icon: UIImage?
    var title: String
    var subTitle: String?
    var handler: () -> Void
    
    init(handler: @escaping () -> Void) {
        self.icon = nil
        self.title = "회원 탈퇴"
        self.subTitle = nil
        self.handler = handler
    }
}
