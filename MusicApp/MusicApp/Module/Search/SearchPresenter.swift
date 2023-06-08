//
//  presenter.swift
//  VIPER
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import Foundation
import MusicAPI

//object
//protocol
//ref to interactorr, routuer, view
enum FetchError: Error {
    case failed
}


protocol SearchPresenterProtocol {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func searchMusic(with searchText: String)
    func interactorDidFetchMusic(with result: Result<[MusicResult], Error>)
}

final class SearchPresenter: SearchPresenterProtocol {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.presenter = self // Interactor'a presenter'ı set et
        }
    }
    
    var view: AnyView?
    
    func searchMusic(with searchText: String) {
        interactor?.getMusics(with: searchText)
    }
    
    func interactorDidFetchMusic(with result: Result<[MusicResult], Error>) {
        switch result {
        case .success(let musicResult):
            view?.update(with: musicResult)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
}

