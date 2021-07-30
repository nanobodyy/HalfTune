//
//  Track.swift
//  halfTune
//
//  Created by Гурген on 30.07.2021.
//

import Foundation

struct Track {
    let artistName: String?
    let trackName: String?
    let previewUrl: URL?
    let index: Int
    
    var downloaded = false
}
