//
//  PictureIngredientViewModel.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/29.
//

import Foundation
import RxSwift
import RxRelay

protocol PictureIngredientViewModelInput {
    func addPicture(data: Data)
    func analyzePictures()
    func managePictures()
    func searchByName()
    func presentNotification()
}

protocol PictureIngredientViewModelOutput {
    var ingredientPictures: BehaviorRelay<[Data]> { get }
    var action: PublishRelay<PictureIngredientAction> { get }
}

protocol PictureIngredientViewModelProtocol:
    PictureIngredientViewModelInput,
    PictureIngredientViewModelOutput {}

public final class PictureIngredientViewModel: PictureIngredientViewModelProtocol {
    // MARK: - Properties
    let ingredientPictures = BehaviorRelay<[Data]>(value: [])
    let action = PublishRelay<PictureIngredientAction>()
    let maxPictureCount = 10
    
    // MARK: - Methods
    public init() {
        
    }
    
    func addPicture(data: Data) {
        if ingredientPictures.value.count >= maxPictureCount { return }
        ingredientPictures.append(data)
    }
    
    func removePicture(at index: Int) {
        
    }
    
    // MARK: @objc Methods
    @objc
    func analyzePictures() { action.accept(.analyze) }
    
    @objc
    func managePictures() { action.accept(.managePicture) }
    
    @objc
    func presentAlbum() { action.accept(.album) }
    
    @objc
    func searchByName() { action.accept(.search) }
    
    @objc
    func presentNotification() { action.accept(.notification) }
}
