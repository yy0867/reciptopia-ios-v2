//
//  MyPageRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/08.
//

import ReciptopiaUIKit
import SnapKit

final class MyPageRootView: BaseView {
    
    // MARK: - Properties
    let sectionManager: MyPageSectionManager
    
    lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProfileCell.self)
        tableView.register(LeaveCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, sectionManager: MyPageSectionManager) {
        self.sectionManager = sectionManager
        super.init(frame: frame)
    }
    
    override func buildHierarchy() {
        addSubview(settingsTableView)
    }
    
    override func activateConstraints() {
        settingsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableView DataSource
extension MyPageRootView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionManager.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionManager.getSection(at: section).settings.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionManager.getSection(at: section).headerTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = sectionManager.getSetting(at: indexPath)
        
        switch setting.type {
            case .profile:
                guard let cell = tableView.dequeue(ProfileCell.self, at: indexPath) else { return UITableViewCell() }
                cell.configureCell(setting: setting)
                return cell
            case .leave:
                guard let cell = tableView.dequeue(LeaveCell.self, at: indexPath) else { return UITableViewCell() }
                cell.configureCell(setting: setting)
                return cell
        }
    }
    
    
}

// MARK: - UITableView Delegate
extension MyPageRootView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 130 }
        else { return 45 }
    }
}
