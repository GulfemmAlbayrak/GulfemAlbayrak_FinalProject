//
//  DetailInteractor.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import Foundation
import MusicAPI

protocol DetailInteractorOutputProtocol {
    func fetchMusicDetailOutput(result: MusicsSourcesResult)
}


final class DetailInteractor {
    var output: SearchInteractorOutputProtocol?
}
