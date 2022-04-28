//
//  AvatarView.swift
//  VkontakteApp028
//
//  Created by PiZero on 23.08.2021.
//

import UIKit

class AvatarView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowOpacity = 0.9
        self.layer.cornerRadius = 50
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = .zero
    }
}
