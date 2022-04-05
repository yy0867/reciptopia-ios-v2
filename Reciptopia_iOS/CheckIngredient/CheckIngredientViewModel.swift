//
//  CheckIngredientViewModel.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/01.
//

import Foundation
import RxRelay
import ReciptopiaUIKit
import ReciptopiaKit

public protocol CheckIngredientViewModelInput {
    func addIngredient(name: String)
}

public protocol CheckIngredientViewModelOutput {
    var ingredients: BehaviorRelay<[Ingredient]> { get }
}

public protocol CheckIngredientViewModelProtocol:
    CheckIngredientViewModelInput,
    CheckIngredientViewModelOutput,
    IngredientCollectionViewDelegate {}

public final class CheckIngredientViewModel: CheckIngredientViewModelProtocol {
    
    // MARK: - Properties
    public let ingredients = BehaviorRelay<[Ingredient]>(value: [])
    
    // MARK: - Methods
    public init() {
        
    }
    
    public func addIngredient(name: String) {
        let ingredient = Ingredient(name: name)
        ingredients.append(ingredient)
    }
}

// MARK: - IngredientCollectionViewDelagate
extension CheckIngredientViewModel {
    public func getName(at index: Int) -> String {
        return ingredients.value[index].name
    }
    
    public func isMainIngredient(at index: Int) -> Bool {
        return ingredients.value[index].isMainIngredient
    }
    
    public func getCount() -> Int {
        return ingredients.value.count
    }
    
    public func remove(at index: Int) {
        ingredients.remove(at: index)
    }
    
    public func changeState(to state: IngredientCell.State, at index: Int) {
        var mutableIngredients = ingredients.value
        mutableIngredients[index].isMainIngredient = (state == .mainIngredient)
        ingredients.accept(mutableIngredients)
    }
}
