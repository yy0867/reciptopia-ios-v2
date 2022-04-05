//
//  IngredientCollectionView.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/01.
//

public final class IngredientCollectionView: UICollectionView {
    
    // MARK: - Properties
    public weak var ingredientDelegate: IngredientCollectionViewDelegate!
    private var cellSize = CGSize()
    
    // MARK: - Methods
    public convenience init(direction: ScrollDirection, cellSize: CGSize) {
        self.init(direction: direction, itemSpacing: 10)
        self.cellSize = cellSize
        delegate = self
        dataSource = self
        register(IngredientCell.self)
        showsVerticalScrollIndicator = false
    }
}

extension IngredientCollectionView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? IngredientCell else { return }
        cell.toggleState()
        ingredientDelegate.changeState(to: cell.ingredientState, at: indexPath.item)
    }
}

extension IngredientCollectionView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(IngredientCell.self, at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let name = ingredientDelegate.getName(at: indexPath.item)
        let state: IngredientCell.State = ingredientDelegate.isMainIngredient(at: indexPath.item) ? .mainIngredient : .subIngredient
        cell.configureCell(ingredientName: name, state: state) { [weak self] in
            self?.ingredientDelegate.remove(at: indexPath.item)
        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredientDelegate.getCount()
    }
}

extension IngredientCollectionView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
