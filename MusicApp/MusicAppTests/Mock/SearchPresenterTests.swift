//
//  SearchPresenterTests.swift
//  MusicAppTests
//
//  Created by Gülfem Albayrak on 13.06.2023.
//

import XCTest
@testable import MusicApp
@testable import MusicAPI

final class SearchPresenterTests: XCTestCase {
    var presenter: SearchPresenter!
    var view: MockSearchViewController!
    var interactor: MockSearchInteractor!
    var router: MockSearchRouter!
    
    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(view: view, router: router, interactor: interactor)
    }
    
    override func tearDown() {
        view = nil
        interactor = nil
        presenter = nil
        router = nil
    }
    
    func test_viewDidLoad_InvokedRequiredViewMethods() {
        XCTAssertFalse(view.isInvokedConfigureTableView, "")
        XCTAssertEqual(view.invokedConfigureTableViewCount, 0)
        XCTAssertFalse(view.isInvokedSetTitle)
        XCTAssertNil(view.invokedSetTitleParameters)
        XCTAssertFalse(interactor.isInvokedFetchMusics)
        XCTAssertEqual(interactor.invokedFetchMusicsCount, 0)
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.isInvokedConfigureTableView, "")
        XCTAssertEqual(view.invokedConfigureTableViewCount, 1)
        XCTAssertTrue(view.isInvokedSetTitle)
        XCTAssertEqual(view.invokedSetTitleParameters?.title, "iTunes")
        XCTAssertTrue(interactor.isInvokedFetchMusics)
        XCTAssertEqual(interactor.invokedFetchMusicsCount, 1)
    }
    
//    func test_fetchNewsOutput() {
//        presenter.fetchMusicsOutput(.success(.results.response))
//    }
//}
//
//extension MusicModel {
//
//    static var musicResult: MusicModel {
//        let bundle = Bundle(for: SearchPresenterTests.self)
//        let path = bundle.path(forResource: "Musics", ofType: "json")!
//        let file = try! String(contentsOfFile: path)
//        let data = file.data(using: .utf8)!
//        let musicResult = try! JSONDecoder().decode(MusicModel.self, from: data)
//        return musicResult
//    }
}
