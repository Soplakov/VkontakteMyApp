//
//  NetworkManager.swift
//  VkontakteApp028
//
//  Created by PiZero on 03.05.2022.
//

import Foundation

// Запросы к Vkontakte API
class NetworkManager {
    
    // Метод для запроса друзей пользователя из сети
    static func getFriends(controller: FriendsViewController) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: MySession.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "fields", value: "nickname, photo_100")
        ]
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            do {
                let friends = try JSONDecoder().decode(FriendsResponseVK.self, from: data!)
                
                controller.setFriends(friends: friends.response.items)
            } catch (let error) {
                print(error)
            }
        }
        task.resume()
    }
}
