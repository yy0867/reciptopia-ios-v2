//
//  Ingredient.swift
//  ReciptopiaKit
//
//  Created by 김세영 on 2022/04/01.
//

public struct Ingredient {
    public var isMainIngredient: Bool
    public let name: String
    public let amount: String
    
    public init(isMainIngredient: Bool = false, name: String, amount: String = "") {
        self.isMainIngredient = isMainIngredient
        self.name = name
        self.amount = amount
    }
}

extension Ingredient {
    public static func stub(isMainIngredient: Bool, name: String, amount: String) -> Ingredient {
        return Ingredient(isMainIngredient: isMainIngredient, name: name, amount: amount)
    }
}
