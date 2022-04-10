//
//  MyPageSectionManager.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

final class MyPageSectionManager {
    
    // MARK: - Properties
    private let section: [MyPageSection]
    var sectionCount: Int {
        section.count
    }
    
    // MARK: - Methods
    init() {
        func makeProfileSetting() -> ProfileSetting {
            return ProfileSetting(
                icon: .defaultProfileIcon,
                title: "nickname",
                subTitle: "email@example.com",
                handler: {}
            )
        }
        
        func makeLeaveSection() -> LeaveSection {
            return LeaveSection(settings: [
                SignOutSetting(handler: {}),
                DeleteAccountSetting(handler: {})
            ])
        }
        
        section = [
            ProfileSection(setting: makeProfileSetting()),
            makeLeaveSection()
        ]
    }
    
    func getSection(at sectionIndex: Int) -> MyPageSection {
        return section[sectionIndex]
    }
    
    func getSetting(at indexPath: IndexPath) -> MyPageSetting {
        return section[indexPath.section].settings[indexPath.row]
    }
}
