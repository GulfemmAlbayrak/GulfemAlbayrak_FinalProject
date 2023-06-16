


//
//  MusicAppUITests.swift
//  MusicAppUITests
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import XCTest

final class SearchViewControllerUITests: XCTestCase {
        
        private var app: XCUIApplication!
        
        override func setUp() {
            super.setUp()
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch()
        }
    
    func testExample() {
        let searchBar = XCUIApplication().otherElements["searchBarIdentifier"]
        XCTAssertTrue(searchBar.exists)
        searchBar.tap()
        sleep(1)
        searchBar.typeText("Tarkan")

        let tableView = app.tables.matching(identifier: "tableViewIdenfier")
        let cell = tableView.cells.element(matching: .cell, identifier: "Cell_0")
        cell.tap()

    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

