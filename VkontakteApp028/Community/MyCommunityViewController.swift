//
//  MyCommunityViewController.swift
//  VkontakteApp028
//
//  Created by PiZero on 14.08.2021.
//

import UIKit

class MyCommunityViewController: UIViewController {

    @IBOutlet var tableViewCommunity: UITableView!
    
    var community = [GroupsItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //community = CommunityStorage().myCommunity
        // Заполнение ячеек таблицы с группами пользователя из репозитория
        tableViewCommunity.delegate = self
        tableViewCommunity.dataSource = self
        NetworkManager.getGroups(controller: self)
    }
    
    func setGroups(community:[GroupsItems]) {
        DispatchQueue.main.async {
            self.community = community
            self.tableViewCommunity.reloadData()
        }
    }
}

// Переопределение ячеек
extension MyCommunityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        community.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCommunityTableViewCell.identifier) as! MyCommunityTableViewCell
        cell.configure(community: community[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем сообщество из массива
            community.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

    //Segue для добавления групп из  контроллера AllCommunity в контроллер MyCommunity
//    @IBAction func addCommunity(_ segue: UIStoryboardSegue) {
//        guard
//            let sourseController = segue.source as? AllCommunityViewController,
//            let indexSelectCell = sourseController.tableViewAllCommunity.indexPathForSelectedRow
//        else { return }
//
//        let communitys = sourseController.allCommunity[indexSelectCell.row]
//        if !community.contains(where: {communitys.nameCommunity == $0.nameCommunity}) { community.append(communitys)
//
//            tableViewCommunity.reloadData()
//        }
//    }
//}
