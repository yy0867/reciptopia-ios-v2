//
//  SearchIngredientViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import ReciptopiaUIKit

public class SearchIngredientViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: SearchIngredientViewModelProtocol
    
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
        
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        searchBar.text = ""
        viewModel.addIngredient(name: text)
    }
}
