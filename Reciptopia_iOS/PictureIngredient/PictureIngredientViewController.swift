//
//  PictureIngredientViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/29.
//

import ReciptopiaUIKit

public final class PictureIngredientViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: PictureIngredientViewModel
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("이름으로 검색", for: .normal)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()
    
    lazy var notificationButton: UIBarButtonItem = {
        let item = UIBarButtonItem(
            image: UIImage(systemName: "bell.fill"),
            style: .plain,
            target: viewModel,
            action: #selector(PictureIngredientViewModel.presentNotification)
        )
        item.tintColor = .black
        return item
    }()
    
    // MARK: - Methods
    public init(viewModel: PictureIngredientViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = PictureIngredientRootView(viewModel: viewModel)
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.titleView = searchButton
        navigationItem.setRightBarButton(notificationButton, animated: false)
        addTargets()
    }
    
    private func addTargets() {
        searchButton.addTarget(
            viewModel,
            action: #selector(PictureIngredientViewModel.searchByName),
            for: .touchUpInside
        )
    }
}
