//
//  ProfileSetting.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import UIKit

struct ProfileSetting: MyPageSetting {
    var type: MyPageSettingType = .profile
    var icon: UIImage?
    var title: String
    var subTitle: String?
    var handler: () -> Void
}
