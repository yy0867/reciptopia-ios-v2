//
//  SearchIngredientViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import ReciptopiaUIKit
import RxSwift
import RxCocoa

public class SearchIngredientViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: SearchIngredientViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.showsCancelButton = true
        searchBar.placeholder = "재료 추가"
        searchBar.returnKeyType = .done
        searchBar.delegate = self
        return searchBar
    }()
    
    // MARK: - Methods
    public init(viewModel: SearchIngredientViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        
        viewModel.searchPublisher
            .bind(onNext: { [weak self] _ in
                self?.searchBar.endEditing(true)
            })
            .disposed(by: disposeBag)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = SearchIngredientRootView(viewModel: viewModel)
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.titleView = searchBar
        // add profile using navigationItem.setLeftBarButtonItem(_:)
    }
}

// MARK: - UISearchBar Delegate
extension SearchIngredientViewController: UISearchBarDelegate {
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true)
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        searchBar.text = ""
        viewModel.addIngredient(name: text)
    }
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel.searchBarClicked()
    }
}
