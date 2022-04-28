//
//  AnimationThirdPoint.swift
//  VkontakteApp028
//
//  Created by PiZero on 13.09.2021.
//

import UIKit

class AnimationThirdPoint: UIViewController {
    // Анимация трех точек меняющих прозрачность по очереди
    private var firstPoint: UILabel = {
        let firstPoint = UILabel()
        firstPoint.translatesAutoresizingMaskIntoConstraints = false
        firstPoint.text = "."
        firstPoint.textColor = UIColor.systemBlue
        firstPoint.font = UIFont.boldSystemFont(ofSize: 100)
        return firstPoint
    }()
    private var secondPoint: UILabel = {
        let secondPoint = UILabel()
        secondPoint.translatesAutoresizingMaskIntoConstraints = false
        secondPoint.text = "."
        secondPoint.textColor = UIColor.systemBlue
        secondPoint.font = UIFont.boldSystemFont(ofSize: 100)
        return secondPoint
    }()
    private var thirdPoint: UILabel = {
        let thirdPoint = UILabel()
        thirdPoint.translatesAutoresizingMaskIntoConstraints = false
        thirdPoint.text = "."
        thirdPoint.textColor = UIColor.systemBlue
        thirdPoint.font = UIFont.boldSystemFont(ofSize: 100)
        return thirdPoint
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstr()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationSecond()
    }
    
    private func setConstr() {
        view.addSubview(firstPoint)
        NSLayoutConstraint.activate([
            firstPoint.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 15),
            firstPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30)
        ])
        view.addSubview(secondPoint)
        NSLayoutConstraint.activate([
            secondPoint.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 15),
            secondPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        view.addSubview(thirdPoint)
        NSLayoutConstraint.activate([
            thirdPoint.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 15),
            thirdPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30)
        ])
    }
    
    func animationSecond() {
        UIView.animateKeyframes(withDuration: 1.5,
                                delay: 0,
                                options: [.repeat],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.15,
                                                       relativeDuration: 0.16,
                                                       animations: {
                                                        self.firstPoint.alpha = 0
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.30,
                                                       relativeDuration: 0.16,
                                                       animations: {
                                                        self.secondPoint.alpha = 0
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.45,
                                                       relativeDuration: 0.16,
                                                       animations: {
                                                        self.thirdPoint.alpha = 0
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.60,
                                                       relativeDuration: 0.16,
                                                       animations: {
                                                        self.firstPoint.alpha = 1
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.75,
                                                       relativeDuration: 0.16,
                                                       animations: {
                                                        self.secondPoint.alpha = 1
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.9,
                                                       relativeDuration: 0.16,
                                                       animations: {
                                                        self.thirdPoint.alpha = 1
                                                       })
                                },
                                completion: nil)
    }
}
