//
//  Track.swift
//  halfTune
//
//  Created by Гурген on 14.07.2021.
//

import Foundation

struct Response {
    let resultCount: Int?
    var results = [Track]()
    
    init(with json: [String: Any]) {
        self.resultCount = json["resultCount"] as? Int
        guard let tracksData = json["results"] as? [Any] else { return }
        
        var index = 0
        
        for item in tracksData {
            if let trackData = item as? [String: Any],
               let artistName = trackData["artistName"] as? String,
               let trackName = trackData["trackName"] as? String,
               let urlString = trackData["previewUrl"] as? String,
               let previewUrl = URL(string: urlString) {
                let trackModel = Track(artistName: artistName, trackName: trackName, previewUrl: previewUrl, index: index)
                self.results.append(trackModel)
                index += 1
            }
        }
    }
}
