//
//  CommunityStorage.swift
//  VkontakteApp028
//
//  Created by PiZero on 15.08.2021.
//

import UIKit

class CommunityStorage {
    
    let myCommunity: [CommunityModel]
    let allCommunity: [CommunityModel]
    
    init() {
        myCommunity = [CommunityModel(imageCommunity: "apple", nameCommunity: "Apple")]
        
        allCommunity = [CommunityModel(imageCommunity: "puma4", nameCommunity: "Puma"), CommunityModel(imageCommunity: "bmw3", nameCommunity: "BMW Motorsport"),CommunityModel(imageCommunity: "tesla5", nameCommunity: "Tesla"), CommunityModel(imageCommunity: "apple", nameCommunity: "Apple"), CommunityModel(imageCommunity: "kino", nameCommunity: "Кино Поиск"),CommunityModel(imageCommunity: "amd_1", nameCommunity: "AMD"), CommunityModel(imageCommunity: "nv6", nameCommunity: "Nvidia"), CommunityModel(imageCommunity: "intel2", nameCommunity: "Intel"), CommunityModel(imageCommunity: "ps4", nameCommunity: "Sony PlayStation 5"), CommunityModel(imageCommunity: "st", nameCommunity: "Steam"), CommunityModel(imageCommunity: "ubisof51", nameCommunity: "Ubisoft"), CommunityModel(imageCommunity: "ea2", nameCommunity: "Electronic Arts"), CommunityModel(imageCommunity: "mortalkombat2", nameCommunity: "Mortal Kombat")
        ]
    }
}
