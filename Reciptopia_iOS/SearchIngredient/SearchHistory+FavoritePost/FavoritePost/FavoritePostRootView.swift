//
//  FavoritePostRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/06.
//

import ReciptopiaUIKit
import RxSwift
import RxCocoa

final class FavoritePostRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: FavoritePostViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var favoritePostTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.register(UITableViewCell.self)
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: FavoritePostViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    override func buildHierarchy() {
        addSubview(favoritePostTableView)
    }
    
    override func activateConstraints() {
        favoritePostTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Bind ViewModel
extension FavoritePostRootView {
    func bindViewModel() {
        viewModel.favoritePosts
            .bind(to: favoritePostTableView.rx.items(cellIdentifier: UITableViewCell.reuseIdentifier)) { index, item, cell in
                cell.setImage(.favoriteStarIcon)
                cell.setTitle(item.postName)
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UITableView Delegate
extension FavoritePostRootView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
