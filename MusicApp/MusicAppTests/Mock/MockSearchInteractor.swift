//
//  MockSearchInteractor.swift
//  MusicAppTests
//
//  Created by Gülfem Albayrak on 13.06.2023.
//

import Foundation
@testable import MusicApp

final class MockSearchInteractor: SearchInteractorProtocol {
    
    var isInvokedFetchMusics = false
    var invokedFetchMusicsCount = 0
    
    func getMusics(with searchText: String) {
        isInvokedFetchMusics = true
        invokedFetchMusicsCount += 1
    }

}
