//
//  FriendsTableViewCell.swift
//  VkontakteApp028
//
//  Created by PiZero on 12.08.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsTableViewCell"  // идентификатор ячейки который указываеться в storyboard
    var avatarTapped: (() -> Void)?
    
    @IBOutlet private var imageAvatar: UIImageView!
    
    @IBOutlet private var labelFriends: UILabel!
    
    @IBOutlet private var avatarView: AvatarView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureAvatar()
        self.configureTap()
    }
    
    func configure(friends: UserItems) {
        labelFriends.text = friends.first_name + " " + friends.last_name
        if friends.photo_100 == nil {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: friends.photo_100!)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.imageAvatar.image = image
                    }
                }
            }
        }
    }
    
    // Закругление иконки друга пользователя
    func configureAvatar() {
        imageAvatar.layer.borderWidth = 2
        imageAvatar.layer.cornerRadius = 50
        imageAvatar.clipsToBounds = true
    }
    
    // Нажатие на иконку друга
    func configureTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedAvatarImage))
        imageAvatar.addGestureRecognizer(tap)
        imageAvatar.isUserInteractionEnabled = true
    }
    @objc func tappedAvatarImage() {
        UIView.animateKeyframes(
            withDuration: 0.3,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.5,
                                   animations: {
                    self.imageAvatar.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5,
                                   relativeDuration: 0.6,
                                   animations: {
                    self.imageAvatar.transform = .identity
                })
            },
            completion: {_ in self.avatarTapped?()
            })
    }
}
