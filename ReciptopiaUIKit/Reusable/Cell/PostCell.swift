//
//  PostCell.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/27.
//

import UIKit
import ReciptopiaKit

open class PostCell: UITableViewCell {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var foodImageCollectionView: LoadableImageCollectionView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!

    public override func awakeFromNib() {
        super.awakeFromNib()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        foodImageCollectionView.reloadData()
    }
    
    public func configureCell(by post: Post) {
        postTitleLabel.text = post.title
        likesLabel.text = "\(post.likes ?? 0)"
        commentsLabel.text = "\(post.comments ?? 0)"
        profileView.setNickname("username")
        profileView.setProfileImage(.defaultProfileIcon)
        
        foodImageCollectionView.setImageURLs(post.pictureURLs)
    }
}
