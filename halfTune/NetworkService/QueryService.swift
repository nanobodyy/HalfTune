//
//  QueryService.swift
//  halfTune
//
//  Created by Гурген on 14.07.2021.
//

import Foundation

class QueryService {
    
    var dataTask: URLSessionDataTask?
    var errorMessage = " "
    let session = URLSession(configuration: .default)
    
    
    
    var tracks = [Track]()
    typealias JSONDictionary = [String: Any]
    typealias QueryReslt = ([Track]?, String) -> Void
    
    func getSearchResult(searchTerm: String, complition:@escaping QueryReslt) {
        
        dataTask?.cancel()
        
        
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")
        urlComponents?.query = "media=music&entity=song&term=\(searchTerm)"
        
        guard let url = urlComponents?.url else {return}
        
        dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            defer {
                self.dataTask = nil
            }
            
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                self.updateSearchResult(with: data)
            }
            complition(self.tracks, self.errorMessage)
            
        })
        dataTask?.resume()
    }
    
    func updateSearchResult(with data: Data) {
        var response: JSONDictionary?
        tracks.removeAll()
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let error as NSError {
            errorMessage = "JSONSerialization error: " + error.localizedDescription
            return
        }
        
        
        
        guard let array = response?["results"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            return
        }
        
        var index = 0
        
        for item in array {
            if let trackDictionary = item as? JSONDictionary,
               let previewURLString = trackDictionary["previewUrl"] as? String,
               let previewURL = URL(string: previewURLString),
               let name = trackDictionary["trackName"] as? String,
               let artist = trackDictionary["artistName"] as? String {
                let track = Track(artist: artist, index: index, name: name, previewURL: previewURL)
                index += 1
                tracks.append(track)
            }
        }
    }
}
