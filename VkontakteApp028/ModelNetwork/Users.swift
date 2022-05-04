//
//  Users.swift
//  VkontakteApp028
//
//  Created by PiZero on 03.05.2022.
//

import Foundation

// Модель для парсинга JSON - Друзья пользователя

class FriendsResponseVK: Decodable {
    let response: FriendsResponse
}
class FriendsResponse: Decodable {
    let count: Int
    let items: [UserItems]
}
class UserItems: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let photo_100: String?
}
