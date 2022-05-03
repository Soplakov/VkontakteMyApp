//
//  LoginVKViewController.swift
//  VkontakteApp028
//
//  Created by PiZero on 03.05.2022.
//

import UIKit
import WebKit

class LoginVKViewController: UIViewController {

    //ID приложения Vkontakte - 7961872
    
    var session = MySession.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadAuthorizeVK()
        
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    
    func loadAuthorizeVK() {
        //Конструктор для URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "oauth.vk.com"
        urlConstructor.path = "/authorize"
        urlConstructor.queryItems = [
            URLQueryItem(name: "client_id", value: "7961872"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        //Запрос
        let request = URLRequest(url: urlConstructor.url!)

        webView.load(request)
        
    }
}

extension LoginVKViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        //Проверка получение данных из URL
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        //Выводим в консоль token и userId
        print("Данные текущей сессии - \(params)")
        if let token = params["access_token"],
           let userId = params["user_id"] {
            //Сохранение token и userId в Singlton
            session.userId = Int(userId)!
            session.token = token
            
            decisionHandler(.cancel)

            // Переход на TabBarController при успешной авторизации
            performSegue(withIdentifier: "toTabBarController", sender: nil)
        } else {
            decisionHandler(.allow)
            // Переход на LoginFormController(старый) при неуспешной авторизации
            performSegue(withIdentifier: "toLoginFormController", sender: nil)
        }
    }
}
