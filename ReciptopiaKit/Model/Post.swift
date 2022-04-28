//
//  Post.swift
//  ReciptopiaKit
//
//  Created by 김세영 on 2022/04/14.
//

public struct Post {
    public let id: Int?
    public let ownerId: Int
    public let title: String
    public let content: String
    public let pictureURLs: [String]
    public let views: Int?
    public let likes: Int?
    public let comments: Int?
    
    public init(
        id: Int? = nil,
        ownerId: Int,
        title: String,
        content: String,
        pictureURLs: [String] = [],
        views: Int? = nil,
        likes: Int? = nil,
        comments: Int? = nil
    ) {
        self.id = id
        self.ownerId = ownerId
        self.title = title
        self.content = content
        self.pictureURLs = pictureURLs
        self.views = views
        self.likes = likes
        self.comments = comments
    }
}
