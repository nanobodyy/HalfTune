//
//  Track.swift
//  halfTune
//
//  Created by Гурген on 14.07.2021.
//

import Foundation

struct Track {
    let artist: String
    let index: Int
    let name: String
    let previewURL: URL
    
    var downloaded = false
}
