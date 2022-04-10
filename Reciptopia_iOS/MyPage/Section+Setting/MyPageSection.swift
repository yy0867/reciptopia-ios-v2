//
//  MyPageSection.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/07.
//

protocol MyPageSection {
    var headerTitle: String? { get }
    var settings: [MyPageSetting] { get }
}
