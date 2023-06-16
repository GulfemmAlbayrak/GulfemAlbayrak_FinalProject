//
//  MockSearchViewController.swift
//  MusicAppTests
//
//  Created by Gülfem Albayrak on 13.06.2023.
//

import Foundation
@testable import MusicApp
@testable import MusicAPI

final class MockSearchViewController: SearchViewControllerProtocol {
    
    var isInvokedShowLoading = false
    var invokedShowLoadingCount = 0
    
    func showLoadingView() {
        isInvokedShowLoading = true
        invokedShowLoadingCount += 1
    }
    
    var isInvokedHideLoading = false
    var invokedHideLoadingCount = 0
    
    func hideLoadingView() {
        isInvokedHideLoading = true
        invokedHideLoadingCount += 1
    }
    var isInvokedgetSearchText = false
    var invokedgetSearchText = 0
    
    func getSearchText() -> String {
        isInvokedgetSearchText = true
        invokedgetSearchText += 1
        return ""
    }
    var isInvokedConfigureSearchBar = false
    var invokedConfigureSearchBarCount = 0
    func configureSearchBar() {
        isInvokedConfigureSearchBar = true
        invokedConfigureSearchBarCount += 1
    }
    var isInvokedConfigureTableView = false
    var invokedConfigureTableViewCount = 0
    
    func configureTableView() {
        isInvokedConfigureTableView = true
        invokedConfigureTableViewCount += 1
    }
    
    var isInvokedUpdate = false
    var invokedUpdateCount = 0
    func update(with musicResult: [MusicResult]) {
        isInvokedUpdate = true
        invokedUpdateCount += 1
    }
    var isInvokedError = false
    func showError(_ message: String) {
        isInvokedError = true
    }
    var isInvokedSetTitle = false
    var invokedSetTitleCount = 0
    var invokedSetTitleParameters: (title: String, Void)?
    func setTitle(_ title: String) {
        isInvokedSetTitle = true
        invokedSetTitleCount += 1
        invokedSetTitleParameters = (title, ())
    }
    
    
}
