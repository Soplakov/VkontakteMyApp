//
//  LoginFormController.swift
//  VkontakteApp028
//
//  Created by PiZero on 11.08.2021.
//

import UIKit

class LoginFormController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Жесты нажания для scrollView
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    @IBOutlet private var scrollView: UIScrollView!
    
    @IBOutlet private var loginInput: UITextField!
    
    @IBOutlet private var passwordInput: UITextField!
    
    @IBOutlet private var logoImage: UIImageView!
    
    @IBOutlet private var loginLabel: UILabel!
    
    @IBOutlet private var passwordLabel: UILabel!
    
    @IBOutlet private var loginButton: UIButton!
    
    
        // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //  Вызов анимации
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateLabelsAppearing()
        animateLogoImage()
        animateAuthButton()
    }
    
    // Метод отписки при исчезновении контроллера с экрана
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Исчезновение клавиатуры при клике по пустому месту на экране
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем введенные данные
        let checkResult = checkUserData()
        
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        // Вернем результат
        return checkResult
    }
    func checkUserData() -> Bool {
        guard let login = loginInput.text,
              let password = passwordInput.text else { return false }
        // Проверка логина и пароля (Оставит поля пустые при сдаче ДЗ)
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        // Создаем контроллер Alert
        let alertController = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let closeAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alertController.addAction(closeAction)
        // Показываем UIAlertController
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        // Авторизация входа в приложение. Получаем текст логина
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = passwordInput.text!
        // Проверяем, верны ли они
        if login == "admin" && password == "123" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }
        
        // Анимация Label(login и password)
    func animateLabelsAppearing() {
        let offset = view.bounds.width
        loginLabel.transform = CGAffineTransform(translationX: offset, y: 0)
        passwordLabel.transform = CGAffineTransform(translationX: offset, y: 0)
        // Анимация - Label появляеться из правой части экрана
        UIView.animate(withDuration: 1.4, delay: 1, options: .curveEaseOut, animations: {
                        self.loginLabel.transform = .identity
                        self.passwordLabel.transform = .identity },
                       completion: nil)
    }
    // Пружинная анимация логотипа VK
    func animateLogoImage() {
        self.logoImage.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height/2)
        UIView.animate(withDuration: 1.4, delay: 0.8, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut , animations: { self.logoImage.transform = .identity },
                       completion: nil)
    }
    // Анимация кнопки "Войти"
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 1.7
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.loginButton.layer.add(animation, forKey: nil)
        
    }
 }
