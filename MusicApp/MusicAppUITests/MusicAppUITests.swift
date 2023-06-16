


//
//  MusicAppUITests.swift
//  MusicAppUITests
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import XCTest

final class MusicAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
//        let app = XCUIApplication()
//        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .searchField).element.tap()
//        
//        let tablesQuery = app.tables
//        tablesQuery.cells.containing(.staticText, identifier:"Şımarık").staticTexts["Tarkan"].tap()
//        app.buttons["love"].tap()
//        app.buttons["play"].tap()
//        app.buttons["pause"].tap()
//        
//        let itunesButton = app.navigationBars["iTunes"].buttons["iTunes"]
//        itunesButton.tap()
//        app.searchFields.containing(.button, identifier:"Clear text").element.tap()
//        tablesQuery.cells.containing(.staticText, identifier:"Yolla").staticTexts["Tarkan"].tap()
//        itunesButton.tap()
//        app.searchFields.buttons["Clear text"].tap()
                        


        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
