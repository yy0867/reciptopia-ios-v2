//
//  SearchIngredientViewModel.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import ReciptopiaKit
import RxRelay

public protocol SearchIngredientViewModelInput {
    func addIngredient(name: String)
    func changeState(isMainIngredient state: Bool, at index: Int)
    func remove(at index: Int)
    func searchBarClicked()
}

public protocol SearchIngredientViewModelAction {
    func searchButtonClicked()
    var searchPublisher: PublishRelay<[Ingredient]> { get }
    var searchBarStartEditing: PublishRelay<Void> { get }
}

public protocol SearchIngredientViewModelOutput {
    var ingredients: BehaviorRelay<[Ingredient]> { get }
    func getName(at index: Int) -> String
    func isMainIngredient(at index: Int) -> Bool
    func getCount() -> Int
}

public protocol SearchIngredientViewModelProtocol:
    SearchIngredientViewModelInput,
    SearchIngredientViewModelAction,
    SearchIngredientViewModelOutput {}

public final class SearchIngredientViewModel: SearchIngredientViewModelProtocol {
    
    // MARK: - Properties
    public let ingredients = BehaviorRelay<[Ingredient]>(value: [])
    public let searchPublisher = PublishRelay<[Ingredient]>()
    public let searchBarStartEditing = PublishRelay<Void>()
    
    // MARK: - Methods
    public init() {

    }
    
    public func addIngredient(name: String) {
        let ingredient = Ingredient(isMainIngredient: false, name: name, amount: "")
        ingredients.append(ingredient)
    }
    
    public func searchButtonClicked() {
        let ingredientNames = ingredients.value.map { $0.name }.joined(separator: ", ")
        print(ingredientNames)
        searchPublisher.accept(ingredients.value)
    }
    
    public func searchBarClicked() {
        searchBarStartEditing.accept(())
    }
}

extension SearchIngredientViewModel {
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
    
    public func changeState(isMainIngredient state: Bool, at index: Int) {
        var mutableIngredients = ingredients.value
        mutableIngredients[index].isMainIngredient = state
        ingredients.accept(mutableIngredients)
    }
}
