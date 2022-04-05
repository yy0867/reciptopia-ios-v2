//
//  ManagePictureRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/31.
//

import ReciptopiaUIKit
import RxSwift
import RxCocoa

final class ManagePictureRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: PictureIngredientViewModel
    let disposeBag = DisposeBag()
    var selectedIndexForRemove = Set<Int>()
    
    lazy var imageCollectionView: UICollectionView = {
        let collectionView = UICollectionView(direction: .vertical)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCell.self)
        return collectionView
    }()
    
    lazy var analyzeIngredientButton: BottomButton = {
        let button = BottomButton(title: "0개의 재료 분석하기")
        return button
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: PictureIngredientViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    // MARK: - Configure UI
    override func buildHierarchy() {
        addSubview(imageCollectionView)
        addSubview(analyzeIngredientButton)
    }
    
    override func activateConstraints() {
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(analyzeIngredientButton.snp.top)
        }
    }
    
    override func addTargets() {
        
    }
}

// MARK: - Bind ViewModel
extension ManagePictureRootView {
    func bindViewModel() {
        viewModel.ingredientPictures
            .map { "\($0.count)개의 재료 분석하기" }
            .bind(to: analyzeIngredientButton.rx.title())
            .disposed(by: disposeBag)
        
        viewModel.ingredientPictures
            .map { !$0.isEmpty }
            .bind(to: analyzeIngredientButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionView Delegate
extension ManagePictureRootView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCell else { return }
        
        if selectedIndexForRemove.contains(indexPath.item) {
            cell.deselectCell()
            selectedIndexForRemove.remove(indexPath.item)
        } else {
            cell.selectCell()
            selectedIndexForRemove.insert(indexPath.item)
        }
    }
}

// MARK: - UICollectionView DataSource
extension ManagePictureRootView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.ingredientPictures.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(ImageCell.self, at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let imageData = viewModel.ingredientPictures.value[indexPath.item]
        let image = UIImage(data: imageData)
        cell.setImage(image)
        
        if selectedIndexForRemove.contains(indexPath.item) { cell.selectCell() }
        else { cell.deselectCell() }
        
        return cell
    }
}

// MARK: - UICollectionView DelegateFlowLayout
extension ManagePictureRootView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideLength = UIScreen.main.bounds.width / 2 - 7.5
        return CGSize(width: sideLength, height: sideLength)
    }
}
