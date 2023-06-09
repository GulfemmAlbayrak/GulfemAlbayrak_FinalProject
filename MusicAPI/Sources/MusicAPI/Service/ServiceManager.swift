////
////  File.swift
////  
////
////  Created by Gülfem Albayrak on 10.06.2023.
////
//
//import Foundation
//protocol MusicServiceProtocol {
//    func fetchMusic(searchText: String, completion: @escaping (Result<[MusicResult], Error>) -> Void)
//}
//
//public class MusicService: MusicServiceProtocol {
//    private let networkService: NetworkService
//
//    public init(networkService: NetworkService = NetworkManager()) {
//        self.networkService = networkService
//    }
//
//    public func fetchMusic(searchText: String, completion: @escaping (Result<[MusicResult], Error>) -> Void) {
//        guard let url = makeURL(searchText: searchText) else {
//            let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorBadURL, userInfo: nil)
//            completion(.failure(error))
//            return
//        }
//
//        networkService.fetchData(with: url) { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let decoder = JSONDecoder()
//                    let musicResponse = try decoder.decode(MusicResponse.self, from: data)
//                    completion(.success(musicResponse.results))
//                } catch {
//                    completion(.failure(NetworkError.jsonDecodingFailed(error)))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//
//    private func makeURL(searchText: String) -> URL? {
//        let urlString = "https://itunes.apple.com/search?term=\(searchText)&media=music"
//        return URL(string: urlString)
//    }
//}
