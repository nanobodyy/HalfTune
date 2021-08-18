//
//  DI.swift
//  halfTune
//
//  Created by Гурген on 17.08.2021.
//

import Foundation

class Container {
    static func createTunesVC() -> TunesViewController {
        let vc = TunesViewController()
        let viewModel = TunesVCViewModel()
        vc.viewModel = viewModel
        return vc
    }
}
