//
//  TunesVCViewModel.swift
//  halfTune
//
//  Created by Гурген on 17.08.2021.
//

import Foundation

class TunesVCViewModel {
    private let queryService = QueryService()
    
    var didData: ((TunesVCViewModel) -> Void)?
    var result = [Track]()
    var resultCount: Int?
    var selectedIndexPath = 0
    
    func fetchTunes(name: String) {
        queryService.getSearchResult(searchTerm: "\(name)") { (response, error) in
            guard let response = response else { return}
            self.resultCount = response.resultCount
            self.result = response.results
            self.didData?(self)
        }
    }
    
    func createViewModelForCell(indexPath: Int) -> TuneCellViewModel {
        let track = result[indexPath]
        let cellViewModel = TuneCellViewModel(track: track)
        return cellViewModel
    }
}

