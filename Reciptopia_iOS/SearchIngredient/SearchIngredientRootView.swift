//
//  SearchIngredientRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import ReciptopiaUIKit
import SnapKit
import RxSwift
import RxCocoa

final class SearchIngredientRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: SearchIngredientViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var ingredientCollectionView: IngredientCollectionView = {
        let collectionView = IngredientCollectionView(direction: .horizontal, cellSize: nil)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.backgroundColor = .brightGray
        collectionView.ingredientDelegate = self
        return collectionView
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: SearchIngredientViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    override func buildHierarchy() {
        addSubview(ingredientCollectionView)
    }

    override func activateConstraints() {
        ingredientCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}

// MARK: - Bind ViewModel
extension SearchIngredientRootView {
    func bindViewModel() {
        viewModel.ingredients
            .bind(onNext: { [weak self] _ in
                self?.ingredientCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - IngredientCollectionView Delegate
extension SearchIngredientRootView: IngredientCollectionViewDelegate {
    func getName(at index: Int) -> String {
        return viewModel.getName(at: index)
    }
    
    func isMainIngredient(at index: Int) -> Bool {
        return viewModel.isMainIngredient(at: index)
    }
    
    func getCount() -> Int {
        return viewModel.getCount()
    }
    
    func remove(at index: Int) {
        viewModel.remove(at: index)
    }
    
    func changeState(to state: IngredientCell.State, at index: Int) {
        viewModel.changeState(isMainIngredient: state == .mainIngredient, at: index)
    }
}
