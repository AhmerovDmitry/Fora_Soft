//
//  DetailViewControllerDelegate + DataSource.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 14.12.2020.
//

import UIKit

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = allTracks[indexPath.row].trackName
            content.secondaryText = album?.artistName
            content.secondaryTextProperties.color = .lightGray
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = allTracks[indexPath.row].trackName
            cell.detailTextLabel?.text = album?.artistName
            cell.detailTextLabel?.textColor = .lightGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
