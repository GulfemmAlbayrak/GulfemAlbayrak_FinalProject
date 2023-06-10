//
//  Router.swift
//  VIPER
//
//  Created by Gülfem Albayrak on 7.06.2023.
//
import MusicAPI
import UIKit
//object
//Entry point


protocol SearchRouterProtocol {
    func navigate(_ route: SearchRoutes)
}

enum SearchRoutes {
    case detail(source: MusicResult?)
}

class SearchRouter {
    
    weak var viewController: SearchViewController?
    
    static func start() -> SearchViewController {
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let router = SearchRouter()
        
        let presenter = SearchPresenter(view: view, router: router, interactor: interactor)
    
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
        
    }
}

extension SearchRouter: SearchRouterProtocol {
    func navigate(_ route: SearchRoutes) {
        print("Navigate to route: \(route)")
        switch route {
        case .detail(let source):
                
//                guard let window = viewController?.view.window else { return }
//                let detailVC = DetailRouter.createModule()
//                detailVC.musicResult = source
//
//                window.navigationController?.pushViewController(detailVC, animated: true)
            
            guard let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
            let detailVC = DetailRouter.createModule()
            detailVC.musicResult = source
            navigationController.pushViewController(detailVC, animated: true)
                
            }
        }
    }


//            guard let window = viewController?.view.window else { return }
//            let detailVC = DetailRouter.createModule()
//            detailVC.musicResult = source
//            let navigationController = UINavigationController(rootViewController: detailVC )
//            window.makeKeyAndVisible()
//            window.rootViewController = navigationController
