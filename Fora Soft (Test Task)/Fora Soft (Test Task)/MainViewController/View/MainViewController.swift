//
//  MainViewController.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 08.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    var allAlbums = [Album?]()
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = .systemGray5
        } else {
            if let textField = searchBar.value(forKey: "searchField") as? UITextField {
                textField.backgroundColor = UIColor(red: 229 / 255,
                                                    green: 229 / 255,
                                                    blue: 234 / 255,
                                                    alpha: 1)
            }
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
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
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
