//
//  FriendsViewController.swift
//  VkontakteApp028
//
//  Created by PiZero on 12.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private var friends: [FriendsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        friends = FriendsStorage().myFriends
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Переход с Friends контроллера на FriendsPhotoViewController(CollectionViev-галлерея с фото друзей)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToPhotoGallery" {
            guard
                let destinationController = segue.destination as? FriendsPhotoViewController,
                let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else { return }
            let selectFriend = friends[indexSelectCell]
            // Передаем название
            destinationController.title = selectFriend.nameFriends
            // Передаем фото
            destinationController.photoGallery = selectFriend.photo
        }
    }
    
    @IBAction func addFriends(_ segue:UIStoryboardSegue) {
        guard
            segue.identifier == "addFriends",
            let sourceController = segue.source as? AllFriendsViewController,
            let indexPaths = sourceController.allFriendsTableView.indexPathForSelectedRow
        else {
            return
        }
        let friend = sourceController.friendsSection[indexPaths.section][indexPaths.row]
        
        if !friends.contains(where: {$0.nameFriends == friend.nameFriends}) {
            friends.append(friend)
            tableView.reloadData()
        }
    }
}

// Переопределение ячеек
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1 // Кол-во секции в таблице
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count  // numberOfRowsInSection(кол-во строк в  каждой секции по умолчанию 1) соответсвует кол-ву друзей(count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        
        cell.configure(friends: friends[indexPath.row])
        cell.avatarTapped = {[weak self] in
            tableView.selectRow(at: indexPath , animated: false, scrollPosition: .none)
            self?.performSegue(withIdentifier: "moveToPhotoGallery", sender: nil)
        }
        return cell
    }
}
