import Foundation
import MusicAPI

//object
//protocol
//ref to presenter

//API CALL


protocol AnyInteractor {
    var presenter: SearchPresenterProtocol? { get set }
    
    func getMusics(with searchText: String)
    
}

class SearchInteractor: AnyInteractor{
    var presenter: SearchPresenterProtocol?
    
    func getMusics(with searchText: String) {
        print("start fetching")
        let musicService = MusicService() // MusicAPI'den bir örnek oluşturun
        
        musicService.fetchMusic(searchText: searchText) { [weak self] result in
            switch result {
            case .success(let musicResults):
                self?.presenter?.interactorDidFetchMusic(with: .success(musicResults))
            case .failure(let error):
                print(error)
                self?.presenter?.interactorDidFetchMusic(with: .failure(error))
            }
        }
    }}


