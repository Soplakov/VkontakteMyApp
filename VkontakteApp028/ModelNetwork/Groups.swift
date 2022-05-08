//
//  Groups.swift
//  VkontakteApp028
//
//  Created by PiZero on 03.05.2022.
//

import Foundation
import RealmSwift

// Модель для парсинга JSON - Группы пользователя

class GroupsResponseVK: Decodable {
    let response: GroupsResponse
}

class GroupsResponse: Decodable {
    let items: [GroupsItems]
}

class GroupsItems: Object, Decodable {
    @objc dynamic var description: String
    @objc dynamic var name: String
    @objc dynamic var photo_200: String?
}
