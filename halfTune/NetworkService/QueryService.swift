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
    
    
    
    //var tracks = [Track]()
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
                complition(self.updateSearchResult(with: data), self.errorMessage)
            }
            //complition(self.tracks, self.errorMessage)
            
        })
        dataTask?.resume()
    }
    
    func updateSearchResult(with data: Data) -> [Track]? {
        
        do {
            guard let  json = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary else { return nil}
            
            let response = Response(with: json)
            return response.results
            
        } catch let error as NSError {
            errorMessage = "JSONSerialization error: " + error.localizedDescription
            return nil
        }
    }
}
