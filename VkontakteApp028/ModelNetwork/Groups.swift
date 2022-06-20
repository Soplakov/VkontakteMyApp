//
//  Groups.swift
//  VkontakteApp028
//
//  Created by PiZero on 03.05.2022.
//

import Foundation

// Модель для парсинга JSON - Группы пользователя

class GroupsResponseVK: Decodable {
    let response: GroupsResponse
}

class GroupsResponse: Decodable {
    let items: [GroupsItems]
}

class GroupsItems: Decodable {
    let description: String
    let name: String
    let photo_200: String?
}
