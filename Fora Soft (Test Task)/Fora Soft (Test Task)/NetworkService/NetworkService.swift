//
//  NetworkService.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 09.12.2020.
//

import UIKit

class NetworkService {
    func fetchData(processedText: String?, urlString: String) -> Void {
        guard let processedText = processedText?.replacingOccurrences(of: " ", with: "+") else { return }
        guard let url = URL(string: "\(urlString)\(processedText)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            DispatchQueue.main.async {
                
                guard let data = data else { return }
                do {
                    let album = try JSONDecoder().decode(AlbumsModel.self, from: data)
                    print(album)
                } catch let error {
                    print(error)
                }
                
            }
        }.resume()
    }
}
