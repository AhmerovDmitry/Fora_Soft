//
//  MainViewController.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 08.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    var allAlbums = [Album?]()
    let baseUrl = "https://itunes.apple.com/search?entity=album&attribute=albumTerm&term="
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.isTranslucent = false
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = .white
        } else {
            // Fallback on earlier versions
        }
        
        return searchBar
    }()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: "cellId")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationItem.titleView = searchBar
        
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        NetworkService().fetchData(processedText: searchBar.text, urlString: baseUrl) { [weak self] (result) in
            switch result {
            case .success(let albums):
                self?.allAlbums = albums
            case .failure(let error):
                print(error)
            }
        }
        collectionView.reloadData()
        searchBar.resignFirstResponder()
    }
}
