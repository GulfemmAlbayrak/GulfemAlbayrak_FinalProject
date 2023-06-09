//
//  DetailRouter.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import Foundation
import UIKit
import MusicAPI

//
//typealias DetailEntryPoint = UIViewController & DetailViewProtocol
//
//protocol DetailRouterProtocol {
//    var entry: DetailEntryPoint? { get }
//    static func createModule() -> DetailEntryPoint
//    func dismissDetail()
//}
//
//
//class DetailRouter: DetailRouterProtocol {
//var entry: DetailEntryPoint?
//
//    static func createModule() -> DetailEntryPoint {
//
//        var view: DetailViewProtocol & UIViewController = DetailViewController()
//        let interactor = DetailInteractor()
//        let presenter = DetailPresenter()
//        let router = DetailRouter()
//
//        view.presenter = presenter
//
//        presenter.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        //presenter.musicResult = musicResult
//
//        router.entry = view
//
//        return view
//    }
//
//    func dismissDetail() {
//        entry?.dismiss(animated: true, completion: nil)
//    }
//
//
//}


//final class DetailRouter {
//    
//    weak var viewController: DetailViewController?
//    
//    static func createModule() -> DetailViewController {
//         let view = DetailViewController()
//         let router = DetailRouter()
//         let presenter = DetailPresenter(view: view, router: router)
//         view.presenter = presenter
//         router.viewController = view
//         return view
//     }
//    
//}

import Foundation



final class DetailRouter {
    
    weak var viewController: DetailViewController?
    
    static func createModule() -> DetailViewController {
         let view = DetailViewController()
         let router = DetailRouter()
         let presenter = DetailPresenter(view: view)
         view.presenter = presenter
         router.viewController = view
         return view
     }
    
}


