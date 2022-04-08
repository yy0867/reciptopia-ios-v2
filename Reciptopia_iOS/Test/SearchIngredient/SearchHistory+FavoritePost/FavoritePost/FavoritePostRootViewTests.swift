//
//  FavoritePostRootViewTests.swift
//  Reciptopia_iOSTests
//
//  Created by 김세영 on 2022/04/07.
//

import XCTest
@testable import Reciptopia_iOS
@testable import ReciptopiaKit
import ReciptopiaUIKit

class FavoritePostRootViewTests: XCTestCase {

    var viewModel: FavoritePostViewModelProtocol!
    var rootView: FavoritePostRootView!
    
    override func setUp() {
        viewModel = FavoritePostViewModel()
        rootView = FavoritePostRootView(viewModel: viewModel)
    }
    
    func test_FavoritePostRootView_favoritePostTableView_shouldBindingFavoritePostsInViewModel() {
        // Given
        let randomCount = Int.random(in: 1...30)
        let favorites = [Favorite](
            repeating: Favorite(postId: 0, postName: randomString()),
            count: randomCount
        )
        
        // When
        viewModel.favoritePosts.accept(favorites)
        
        // Then
        let cellCount = rootView.favoritePostTableView.numberOfRows(inSection: 0)
        XCTAssertEqual(cellCount, randomCount)
        
        for index in 0..<randomCount {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = rootView.favoritePostTableView
                .dataSource?
                .tableView(rootView.favoritePostTableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell?.textLabel?.text, favorites[index].postName)
        }
    }
}
