//
//  PhotoGallery.swift
//  VkontakteApp028
//
//  Created by PiZero on 19.08.2021.
//

import UIKit

struct PhotoModel {
    let photoName: String
    var likeCount: Int
    var theLike: Bool {
        didSet {
            likeCount += theLike ? 1 : -1
        }
    }
}
