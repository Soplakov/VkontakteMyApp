//
//  FriendsPhotoViewController.swift
//  VkontakteApp028
//
//  Created by PiZero on 18.08.2021.
//

import UIKit

class FriendsPhotoViewController: UIViewController {
    
    @IBOutlet private var photoCollectionView: UICollectionView!
    
    var photoGallery: [PhotoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            // Проверям сегу
            segue.identifier == "toBigPhoto",
            // Кастим
            let destinationController = segue.destination as? BigPhotoFriendsViewController,
            // Сохраняем индексы выбранных изображений
            let indexPaths = photoCollectionView.indexPathsForSelectedItems
        else { return }
        // Кастим чтобы получить не массив
        let indexPath = indexPaths[0] as IndexPath
        // Отправляем
        destinationController.bigPhotoFriends = photoGallery
        destinationController.sourseIndexPath = indexPath
    }
}

extension FriendsPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsPhotoViewCell.identifier, for: indexPath) as! FriendsPhotoViewCell
        let photo = photoGallery[indexPath.item]
        cell.configure(photoGallery: photo)
        cell.likeTapped = { [weak self] in self? .photoGallery[indexPath.item].theLike.toggle()
            collectionView.reloadSections(IndexSet(integer: 0))
        }
        return cell
    }
}
