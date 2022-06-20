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
    
    func configure(community: GroupsItems) {
        labelCommunity.text = community.description + " " + community.name
        if community.photo_200 == nil {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: community.photo_200!)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.imageCommunity.image = image
                    }
                }
            }
        }
    }
}
