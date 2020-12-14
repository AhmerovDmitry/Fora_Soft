//
//  TrackModel.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 14.12.2020.
//

import UIKit

struct TracksModel: Codable {
    var results: [Track?]
}

struct Track: Codable {
    var trackName: String?
    var trackNumber: Int?
}
