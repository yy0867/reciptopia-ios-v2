//
//  IngredientCollectionViewDelegate.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/01.
//

public protocol IngredientCollectionViewDelegate: AnyObject {
    func getName(at index: Int) -> String
    func isMainIngredient(at index: Int) -> Bool
    func getCount() -> Int
    func remove(at index: Int)
    func changeState(to state: IngredientCell.State, at index: Int)
}
