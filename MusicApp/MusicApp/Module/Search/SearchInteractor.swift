
//Interactor

import Foundation
import MusicAPI

//object
//protocol
//ref to presenter

//API CALL

typealias MusicsSourcesResult = Result<[MusicResult],Error>

protocol SearchInteractorProtocol: AnyObject {
   // var presenter: SearchPresenterProtocol? { get set }
    func getMusics(with searchText: String)
    // var output: SearchInteractorProtocol? { get set }
    
}

protocol SearchInteractorOutputProtocol {
    func fetchMusicsOutput(_ result: MusicsSourcesResult)
}
fileprivate var musicService = MusicService()

final class SearchInteractor {
    var output: SearchInteractorOutputProtocol?
}

extension SearchInteractor: SearchInteractorProtocol {

    
    //var presenter: SearchPresenterProtocol?
    func getMusics(with searchText: String) {
        print("start fetching")
        //let musicService = MusicService() // MusicAPI'den bir örnek oluşturun
        
        musicService.fetchMusic(searchText: searchText) { [weak self] result in
            guard let self else { return }
            self.output?.fetchMusicsOutput(result)
        }
    }
}

// class SearchInteractor: SearchInteractorProtocol{
//    var presenter: SearchPresenterProtocol?
//     func getMusics(with searchText: String) {
//         print("start fetching")
//         let musicService = MusicService() // MusicAPI'den bir örnek oluşturun
//
//         musicService.fetchMusic(searchText: searchText) { [weak self] result in
//             switch result {
//             case .success(let musicResults):
//                 self?.presenter?.interactorDidFetchMusic(with: .success(musicResults))
//             case .failure(let error):
//                 print(error)
//                 self?.presenter?.interactorDidFetchMusic(with: .failure(error))
//             }
//         }
//     }
// }

/*
 
 typealias MusicsSourcesResult = Result<MusicModel, NetworkError>

 protocol SearchInteractorProtocol: AnyObject {
 func getMusics(with searchText: String)
 }

 protocol HomeInteractorOutputProtocol {
    func fetchMusicsOutput(_ result: MusicsSourcesResult)
 }

 fileprivate var musicService = MusicService()

 final class SearchInteractor {
     var output: SearchInteractorProtocol?
 }

 extension SearchInteractor: SearchInteractorProtocol {
     
    func getMusics(with searchText: String) {
    musicService.fetchMusic(searchText: searchText) { [weak self] result in
             guard let self else { return }
             self.output?.fetchNewsOutput(result)
         }
     }
     
     
 }

 
 
 */



