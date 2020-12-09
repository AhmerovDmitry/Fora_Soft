//
//  MainViewController.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 08.12.2020.
//

import UIKit

class MainViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationItem.titleView = searchBar
    }
    
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        NetworkService().fetchData(processedText: searchBar.text, urlString: baseUrl)
    }
}
