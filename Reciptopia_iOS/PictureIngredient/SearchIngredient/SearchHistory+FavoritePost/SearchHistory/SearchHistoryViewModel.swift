//
//  SearchHistoryViewModel.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import RxRelay
import ReciptopiaKit

protocol SearchHistoryViewModelInput {
    func addHistory(ingredients: [(name: String, isMainIngredient: Bool)])
    func removeHistory(at index: Int)
}

protocol SearchHistoryViewModelOutput {
    var histories: BehaviorRelay<[History]> { get }
}

protocol SearchHistoryViewModelProtocol:
    SearchHistoryViewModelInput,
    SearchHistoryViewModelOutput {}

final class SearchHistoryViewModel: SearchHistoryViewModelProtocol {
    
    // MARK: - Properties
    let histories = BehaviorRelay<[History]>(value: [])
    
    // MARK: - Methods
    init() {
        let history1 = History(ingredients: [
            .stub(isMainIngredient: true, name: "감자", amount: ""),
            .stub(isMainIngredient: true, name: "양파", amount: ""),
            .stub(isMainIngredient: true, name: "소시지", amount: ""),
            .stub(isMainIngredient: true, name: "김치", amount: ""),
        ])
        let history2 = History(ingredients: [
            .stub(isMainIngredient: true, name: "다진마늘", amount: ""),
            .stub(isMainIngredient: true, name: "스팸", amount: ""),
            .stub(isMainIngredient: true, name: "소금", amount: ""),
        ])
        let history3 = History(ingredients: [
            .stub(isMainIngredient: true, name: "팽이버섯", amount: ""),
            .stub(isMainIngredient: true, name: "된장", amount: ""),
            .stub(isMainIngredient: true, name: "애호박", amount: ""),
            .stub(isMainIngredient: true, name: "마늘", amount: ""),
        ])
        let stubs = [history1, history2, history3]
        
        stubs.forEach { history in
            histories.append(history)
        }
    }
    
    func addHistory(ingredients: [(name: String, isMainIngredient: Bool)]) {
        let ingredientForHistory = ingredients.map { ingredient in
            Ingredient(isMainIngredient: ingredient.isMainIngredient, name: ingredient.name)
        }
        let history = History(ingredients: ingredientForHistory)
        histories.append(history)
    }
    
    func removeHistory(at index: Int) {
        histories.remove(at: index)
    }
}
