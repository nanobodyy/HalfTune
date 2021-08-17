//
//  DI.swift
//  halfTune
//
//  Created by Гурген on 17.08.2021.
//

import Foundation

class DI {
    static func createVC() -> TunesViewController {
        let vc = TunesViewController()
        let viewModel = TunesVCViewModel()
        vc.viewModel = viewModel
        return vc
    }
}
