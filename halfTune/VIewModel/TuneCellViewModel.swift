//
//  TuneCellViewModel.swift
//  halfTune
//
//  Created by Гурген on 17.08.2021.
//

import Foundation

class TuneCellViewModel {
    
    var track: Track
    
    init(track: Track) {
        self.track = track
    }
    
    var title: String {
        guard let name = track.trackName else { return "Unnkowed" }
        return name
    }
    
    var artist: String {
        guard let artist = track.artistName else { return "Unnkowed"}
        return artist
    }
}
