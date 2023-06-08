
//  SplashInteractor.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.


import Foundation
import MusicAPI

protocol SplashInteractorProtocol {
    func checkInternetConnection()
}

protocol SplashInteractorOutputProtocol {
    func internetConnection(status: Bool)
}

final class SplashInteractor {
    var output: SplashInteractorOutputProtocol?
}

extension SplashInteractor: SplashInteractorProtocol {
    
    func checkInternetConnection() {
//        let internetStatus = API.shared.isConnectedToInternet()
//        self.output?.internetConnection(status: internetStatus)
    }
   
}
