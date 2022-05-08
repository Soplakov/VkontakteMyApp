//
//  Users.swift
//  VkontakteApp028
//
//  Created by PiZero on 03.05.2022.
//

import Foundation
import RealmSwift

// Модель для парсинга JSON - Друзья пользователя

class FriendsResponseVK: Decodable {
    let response: FriendsResponse
}
class FriendsResponse: Decodable {
    let count: Int
    let items: [UserItems]
}
class UserItems: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var first_name: String
    @objc dynamic var last_name: String
    @objc dynamic var photo_100: String?
}
