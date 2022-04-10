//
//  LeaveSection.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

struct LeaveSection: MyPageSection {
    var headerTitle: String? = "계정 관리"
    var settings: [MyPageSetting]
    
    init(settings: [MyPageSetting]) {
        self.settings = settings
    }
}
