//
//  File.swift
//  
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import Foundation
import Alamofire

protocol MusicServiceProtocol {
    func fetchMusic(searchText: String, completion: @escaping (Result<[MusicResult], Error>) -> Void)
}

public class MusicService: MusicServiceProtocol {
    
    public init() { }
    
    public func fetchMusic(searchText: String, completion: @escaping (Result<[MusicResult], Error>) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&media=music"
        
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let musicResponse = try decoder.decode(MusicResponse.self, from: data)
                    completion(.success(musicResponse.results))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
