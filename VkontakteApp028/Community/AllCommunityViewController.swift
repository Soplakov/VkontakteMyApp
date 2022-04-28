//
//  AllCommunityViewController.swift
//  VkontakteApp028
//
//  Created by PiZero on 18.08.2021.
//

import UIKit

class AllCommunityViewController: UIViewController {
    
    @IBOutlet var tableViewAllCommunity: UITableView!
    
    let storage: CommunityStorage = CommunityStorage()
    
    var allCommunity: [CommunityModel] = []
    
    
    private let searchController = UISearchController(searchResultsController: nil)
    // Свойство которое будет определять является ли строка поиска пустой
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false } // Свойство будет возвращать true если строка поиска пустая
        return text.isEmpty
    }
    //Отслеживаем активацию поискового запроса, возвращаем true если строка поиска активирована и не является пустой
    private var isFiltering: Bool {
        return !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCommunity = storage.allCommunity
        tableViewAllCommunity.delegate = self
        tableViewAllCommunity.dataSource = self
        
        // Настройка Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск сообществ"
        navigationItem.searchController = searchController
        // Отпускаем строку поиска при переходе на другой экран
        definesPresentationContext = true
    }
}

extension AllCommunityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return allCommunity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllCommunityTableViewCell.identifier) as! AllCommunityTableViewCell
        
        var community: CommunityModel

            community = allCommunity[indexPath.row]
        
        cell.labelAllCommunity?.text = community.nameCommunity
        cell.imageAllCommunity.image = UIImage(named: community.imageCommunity)
        //cell.configure(allCommunity: allCommunity[indexPath.row])
        
        return cell
    }
}

// Расширение для поиска
extension AllCommunityViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        guard !searchText.isEmpty else {
        allCommunity = storage.allCommunity
            tableViewAllCommunity.reloadData()
            return
        }
        allCommunity = storage.allCommunity.filter({ (community: CommunityModel) -> Bool in
            return community.nameCommunity.lowercased().contains(searchText.lowercased())
        })
        // Перезапуск после фильтрации
        tableViewAllCommunity.reloadData()
    }
}
