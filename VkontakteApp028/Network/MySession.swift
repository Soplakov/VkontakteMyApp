//
//  MySession.swift
//  VkontakteApp028
//
//  Created by PiZero on 28.04.2022.
//

import Foundation

//Singleton - для хранения данных о текущей сессии пользователя
class MySession {
    
    private init() {}
    //Класс хранит в себе свой же единственный объект
    static let instance = MySession()
    
    var token: String = ""
    //Для хранения токена VK
    var userId: Int = 0
    //Для хранения идентификатора пользователя VK
    //
}
