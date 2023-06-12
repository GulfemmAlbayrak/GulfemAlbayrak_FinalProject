
import Foundation
import MusicAPI

typealias MusicsSourcesResult = Result<[MusicResult],Error>

protocol SearchInteractorProtocol: AnyObject {
    func getMusics(with searchText: String)
    
}

protocol SearchInteractorOutputProtocol {
    func fetchMusicsOutput(_ result: MusicsSourcesResult)
}
fileprivate var musicService = MusicService()

final class SearchInteractor {
    var output: SearchInteractorOutputProtocol?
}

extension SearchInteractor: SearchInteractorProtocol {
    
    func getMusics(with searchText: String) {
        print("start fetching")
        musicService.fetchMusic(searchText: searchText) { [weak self] result in
            guard let self else { return }
            self.output?.fetchMusicsOutput(result)
        }
    }
}




