//
//  DetailRouter.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import Foundation
import UIKit
import MusicAPI

//final class DetailRouter {
//
//    weak var viewController: DetailViewController?
//
//    static func createModule() -> DetailViewController {
//         let view = DetailViewController()
//         let router = DetailRouter()
//         let presenter = DetailPresenter(view: view)
//         view.presenter = presenter
//         router.viewController = view
//
//         return view
//     }
//
//}


enum DetailRoutes {
    case home
}

protocol DetailRouterProtocol {
    func navigate(_ route: DetailRoutes)
}

final class DetailRouter {
    
    weak var viewController: DetailViewController?
    
    static func createModule() -> DetailViewController {
        let view = DetailViewController()
        let router = DetailRouter()
        let presenter = DetailPresenter(
            view: view
        )
        view.presenter = presenter
        router.viewController = view
        return view
    }
}

extension DetailRouter: DetailRouterProtocol {
    
    func navigate(_ route: DetailRoutes) {
        switch route {
        case .home:
            let homeVC = SearchRouter.start()
            viewController?.navigationController?.pushViewController(homeVC, animated: true) //Bu doğru mu ?
        }
    }
}
