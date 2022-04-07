//
//  SearchHistoryRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/06.
//

import ReciptopiaUIKit
import RxSwift
import RxCocoa

final class SearchHistoryRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: SearchHistoryViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self)
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: SearchHistoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    override func buildHierarchy() {
        addSubview(historyTableView)
    }
    
    override func activateConstraints() {
        historyTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Bind ViewModel
extension SearchHistoryRootView {
    func bindViewModel() {
        viewModel.histories
            .map { $0.reversed() }
            .bind(to: historyTableView.rx.items(cellIdentifier: UITableViewCell.reuseIdentifier)) { index, item, cell in
                cell.setImage(.searchHistoryIcon)
                cell.setTitle(item.ingredients.map { $0.name }.joined(separator: ", "))
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UITableView Delegate
extension SearchHistoryRootView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { [weak self] _, _, handler in
            self?.viewModel.removeHistory(at: indexPath.row)
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
