//
//  BigPhotoFriendsViewController.swift
//  VkontakteApp028
//
//  Created by PiZero on 08.09.2021.
//

import UIKit

class BigPhotoFriendsViewController: UIViewController {
    
    @IBOutlet var bigView: BigPhotoFriendsView!
    
    var bigPhotoFriends: [PhotoModel] = []
    var sourseIndexPath: IndexPath = IndexPath()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigView.photoes = bigPhotoFriends.map({$0.photoName})
        bigView.visibleIndex = sourseIndexPath.item
        tabBarController?.tabBar.isHidden = true
        //navigationController?.navigationBar.isHidden = true
        // Скрывает и показвает Navigation и TabBar
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        //navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.subviews.forEach({$0.removeFromSuperview()})
    }
}
