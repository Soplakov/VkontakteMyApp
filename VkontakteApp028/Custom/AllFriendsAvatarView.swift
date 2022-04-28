//
//  AllFriendsAvatarView.swift
//  VkontakteApp028
//
//  Created by PiZero on 13.09.2021.
//

import UIKit
class AllFriendsAvatarView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowOpacity = 0.9
        self.layer.cornerRadius = 50
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = .zero
    }
}
