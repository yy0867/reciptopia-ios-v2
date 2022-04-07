//
//  FavoritePostViewModel.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/05.
//

import Foundation
import RxRelay
import ReciptopiaKit

protocol FavoritePostViewModelInput {
    
}

protocol FavoritePostViewModelOutput {
    var favoritePosts: BehaviorRelay<[Favorite]> { get }
}

protocol FavoritePostViewModelProtocol:
    FavoritePostViewModelInput,
    FavoritePostViewModelOutput {}

final class FavoritePostViewModel: FavoritePostViewModelProtocol {
    
    // MARK: - Properties
    let favoritePosts = BehaviorRelay<[Favorite]>(value: [])
    
    // MARK: - Methods
    init() {
        let favorite1 = Favorite(postId: 0, postName: "Favorite1")
        let favorite2 = Favorite(postId: 0, postName: "Favorite2")
        let favorite3 = Favorite(postId: 0, postName: "Favorite3")
        let favorite4 = Favorite(postId: 0, postName: "Favorite4")
        let favorites = [favorite1, favorite2, favorite3, favorite4]
        
        favoritePosts.accept(favorites)
    }
}
