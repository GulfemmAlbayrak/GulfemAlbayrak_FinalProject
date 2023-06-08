//
//  Router.swift
//  VIPER
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import Foundation
import UIKit

//object
//Entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class SearchRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = SearchRouter()
        
        // Assign VIP
        var view: AnyView & UIViewController = SearchViewController() // ViewController tipini değiştir
        var presenter: SearchPresenterProtocol = SearchPresenter()
        var interactor: AnyInteractor = SearchInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view
        
        return router
    }
}
