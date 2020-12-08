//
//  MainViewController.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 08.12.2020.
//

import UIKit

class MainViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationItem.titleView = searchBar
    }
    
}

extension MainViewController: UISearchBarDelegate {
    
}
