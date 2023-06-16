//
//  MockSearchRouter.swift
//  MusicAppTests
//
//  Created by Gülfem Albayrak on 13.06.2023.
//

import Foundation
@testable import MusicApp
@testable import MusicAPI

final class MockSearchRouter: SearchRouterProtocol {
    
    var isINvokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: SearchRoutes, Void?)
    
    init() {
        invokedNavigateParameters = (route: .detail(source: nil), ())
    }
    
    func navigate(_ route: MusicApp.SearchRoutes) {
        isINvokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
    }
    
    
}
