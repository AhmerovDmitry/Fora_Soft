//
//  NetworkService.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 09.12.2020.
//

import UIKit

class NetworkService {
    
    let baseUrl = "https://itunes.apple.com/search?entity=album&attribute=albumTerm&term="
    let songsUrl = "https://itunes.apple.com/lookup?entity=song&id="
    
    func fetchAlbums(processedText: String?, complition: @escaping (Result<[Album?], Error>) -> Void) {
        guard let processedText = processedText?.replacingOccurrences(of: " ", with: "+") else { return }
        guard let url = URL(string: "\(baseUrl)\(processedText)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let album = try JSONDecoder().decode(AlbumsModel.self, from: data)
                    complition(.success(album.results))
                } catch let error {
                    complition(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchAlbumTracks (collectionId: Int, complition: @escaping (Result<[Track?], Error>) -> Void) {
        guard let url = URL(string: "\(songsUrl)\(collectionId)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let tracks = try JSONDecoder().decode(TracksModel.self, from: data)
                    complition(.success(tracks.results))
                } catch {
                    complition(.failure(error))
                }
            }
        }.resume()
    }
    
}
