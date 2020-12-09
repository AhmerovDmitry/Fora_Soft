//
//  AlbumModel.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 09.12.2020.
//

import UIKit

struct AlbumsModel: Codable {
    var results: [Album?]
}

struct Album: Codable {
    var artistName: String?
    var collectionName: String?
    var primaryGenreName: String?
    var trackCount: Int?
    var releaseDate: String?
    var artworkUrl100: String?
}
