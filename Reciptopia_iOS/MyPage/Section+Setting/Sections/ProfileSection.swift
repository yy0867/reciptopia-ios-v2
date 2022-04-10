//
//  ProfileSection.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

struct ProfileSection: MyPageSection {
    let headerTitle: String? = "프로필"
    let settings: [MyPageSetting]
    
    init(setting: ProfileSetting) {
        self.settings = [setting]
    }
}
