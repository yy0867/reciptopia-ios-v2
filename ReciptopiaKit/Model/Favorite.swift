//
//  Favorite.swift
//  ReciptopiaKit
//
//  Created by 김세영 on 2022/04/07.
//

public struct Favorite {
    public let postId: Int
    public let postName: String
    
    public init(postId: Int, postName: String) {
        self.postId = postId
        self.postName = postName
    }
}

