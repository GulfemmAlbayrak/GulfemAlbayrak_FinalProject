
import MusicAPI
import Foundation

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
        switch route {
        case .detail(let source):
            let detailVC = DetailRouter.createModule()
            detailVC.musicResult = source
            viewController?.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}



