//
//  AddFriendsTableViewCell.swift
//  VkontakteApp028
//
//  Created by PiZero on 13.09.2021.
//

import UIKit

class AddFriendsTableViewCell: UITableViewCell {
    
    static let identifier = "AddFriendsTableViewCell"
    
    
    @IBOutlet private var imageAvatar: UIImageView!
    
    @IBOutlet private var labelFriends: UILabel!
    
    @IBOutlet private var AllFriendsAvatarView: AllFriendsAvatarView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureAvatar()

    }
    
    func configure(friends: FriendsModel) {
        imageAvatar.image = UIImage (named: friends.imageFriends)
        labelFriends.text = friends.nameFriends
    }
    
    func configureAvatar() {
        imageAvatar.layer.borderWidth = 2
        imageAvatar.layer.cornerRadius = 28
        imageAvatar.clipsToBounds = true
    }
}
