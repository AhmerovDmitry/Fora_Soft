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

extension DetailViewController {
    
    func setupArtistInfo() {
        guard let album = album else { return }
        
        artistAlbumName.text = album.collectionName
        artistName.text = album.artistName
        artistStyle.text = album.primaryGenreName
        trackCount.text = "\(album.trackCount ?? 0) Songs"
        
        titleImage.image = UIImage(
            data: try! Data(
                contentsOf: URL(
                    string: (album.artworkUrl100!)
                )!
            )
        )
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        if let date = dateFormatterGet.date(from: album.releaseDate!) {
            releaseDate.text = dateFormatterPrint.string(from: date)
        } else {
            print("There was an error decoding the string")
        }
    }
    
    func fetchTracks() {
        DispatchQueue.main.async {
            NetworkService().fetchAlbumTracks(collectionId: (self.album?.collectionId)!) { [weak self] (result) in
                switch result {
                case .success(let tracks):
                    for track in tracks {
                        if track?.trackName != nil {
                            self?.allTracks.append(track!)
                        }
                    }
                case .failure(let error):
                    print(error)
                }
                self?.tableView.reloadData()
            }
        }
    }
    
}
