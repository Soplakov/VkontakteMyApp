//
//  AllCommunityTableViewCell.swift
//  VkontakteApp028
//
//  Created by PiZero on 18.08.2021.
//

import UIKit

class AllCommunityTableViewCell: UITableViewCell {
    
    static let identifier = "AllCommunityTableViewCell"
    
    @IBOutlet var imageAllCommunity: UIImageView!
    
    @IBOutlet var labelAllCommunity: UILabel!
    
    func configure(allCommunity: CommunityModel) {
        imageAllCommunity.image = UIImage (named: allCommunity.imageCommunity)
        labelAllCommunity.text = allCommunity.nameCommunity
    }
}
