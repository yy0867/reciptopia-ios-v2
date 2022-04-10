//
//  MyPageSettings.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import UIKit

protocol MyPageSetting {
    var type: MyPageSettingType { get }
    var icon: UIImage? { get set }
    var title: String { get set }
    var subTitle: String? { get set }
    var handler: () -> Void { get set }
}

enum MyPageSettingType {
    case profile
    case leave
}
