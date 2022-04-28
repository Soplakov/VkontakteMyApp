//
//  FriendsPhotoViewCell.swift
//  VkontakteApp028
//
//  Created by PiZero on 19.08.2021.
//

import UIKit

class FriendsPhotoViewCell: UICollectionViewCell {
    
    static let identifier = "FriendsPhotoViewCell"
    var likeTapped: (() -> Void)?
    
    
    @IBOutlet private var photoImage: UIImageView!
    
    @IBOutlet private var photoLabel: UILabel!
    
    @IBOutlet private var likeControl: LikeControl!
    
    
    func configure(photoGallery: PhotoModel) {
        photoImage.image = UIImage(named: photoGallery.photoName)
        likeControl.configure(theLike: photoGallery.theLike, likeCount: photoGallery.likeCount)
        likeControl.controlTapped = {[weak self] in
            self?.likeTapped?()
        }
    }
}
