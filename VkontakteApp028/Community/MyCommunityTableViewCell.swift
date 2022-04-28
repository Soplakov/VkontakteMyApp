//
//  MyCommunityTableViewCell.swift
//  VkontakteApp028
//
//  Created by PiZero on 15.08.2021.
//

import UIKit

class MyCommunityTableViewCell: UITableViewCell {

    static let identifier = "MyCommunityTableViewCell"
    
    @IBOutlet private var imageCommunity: UIImageView!
    
    @IBOutlet private var labelCommunity: UILabel!
    
    func configure(community: CommunityModel) {
        imageCommunity.image = UIImage (named: community.imageCommunity)
        labelCommunity.text = community.nameCommunity
   }
}
