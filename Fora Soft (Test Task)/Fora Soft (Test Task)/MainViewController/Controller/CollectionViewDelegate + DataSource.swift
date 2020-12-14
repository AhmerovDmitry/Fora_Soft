//
//  CollectionViewDelegate + DataSource.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 09.12.2020.
//

import UIKit

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allAlbums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = UIScreen.main.bounds.width
        
        return CGSize(width: cellSize / 4, height: cellSize / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CollectionViewCell
        cell.updateCellData(album: allAlbums[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let detailController = DetailViewController()
        detailController.album = allAlbums[indexPath.item]
        
        navigationController?.pushViewController(detailController, animated: true)
        searchBar.resignFirstResponder()
    }
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        NetworkService().fetchAlbums(processedText: searchBar.text) { [weak self] (result) in
            switch result {
            case .success(let albums):
                self?.allAlbums = albums.sorted(by: { $0?.collectionName ?? "collectionName" < $1?.collectionName ?? "collectionName" })
            case .failure(let error):
                print(error)
            }
            self?.collectionView.reloadData()
            self?.searchBar.resignFirstResponder()
        }
    }
}
