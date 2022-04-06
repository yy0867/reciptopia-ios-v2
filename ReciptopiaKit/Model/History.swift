//
//  History.swift
//  ReciptopiaKit
//
//  Created by 김세영 on 2022/04/06.
//

public struct History {
    public var latestSearchTime: Date
    public let ingredients: [Ingredient]
    
    public init(ingredients: [Ingredient]) {
        self.latestSearchTime = Date()
        self.ingredients = ingredients
    }
}
