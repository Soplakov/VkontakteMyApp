//
//  AllFriendsViewController.swift
//  VkontakteApp028
//
//  Created by PiZero on 13.09.2021.
//

import UIKit

class AllFriendsViewController: UIViewController {
    
    @IBOutlet var allFriendsTableView: UITableView!
    
    var friendsSection = [[FriendsModel]]()
    var firstLetters: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let allFriends = FriendsStorage.shared.allFiends
        firstLetters = getFirstLetters(allFriends)
        
        friendsSection = sortedForSection(allFriends, firstLetters: firstLetters)
        
        allFriendsTableView.dataSource = self
        allFriendsTableView.delegate = self
        
        allFriendsTableView.register(CustomHeaderView.self,
                                               forHeaderFooterViewReuseIdentifier: CustomHeaderView.reusedIdentifier)
    }
    private func getFirstLetters(_ allFriends: [FriendsModel]) -> [String] {
        let friendsName = allFriends.map { $0.nameFriends }
        let firstLetters = Array(Set(friendsName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }
    private func sortedForSection(_ allFriends: [FriendsModel], firstLetters: [String]) -> [[FriendsModel]] {
        var friendsSorted: [[FriendsModel]] = []
        firstLetters.forEach { letter in
            let friendsForLetter = allFriends.filter { String($0.nameFriends.prefix(1)) == letter}
            friendsSorted.append(friendsForLetter)
        }
        return friendsSorted
    }
}

extension AllFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        friendsSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AddFriendsTableViewCell.identifier, for: indexPath) as? AddFriendsTableViewCell
        else {
            return UITableViewCell()
        }
        let friend = friendsSection[indexPath.section][indexPath.row]
        cell.configure(friends: friend)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.reusedIdentifier) as? CustomHeaderView
        else {
            return nil
        }
        header.configure(title: firstLetters[section])
        return header
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addFriends", sender: nil)
    }
}
