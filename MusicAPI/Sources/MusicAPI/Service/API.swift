//
//  File.swift
//  
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import Foundation


enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
}

struct SearchResult: Codable {
    let artistName: String
    let trackName: String
    let previewUrl: URL
}


class APIService {
    typealias CompletionHandler = (Result<[SearchResult], APIError>) -> Void
    
    func search(term: String, completion: @escaping CompletionHandler) {
        guard let url = buildURL(with: term) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(SearchResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    private func buildURL(with term: String) -> URL? {
        let encodedTerm = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://itunes.apple.com/search?term=\(encodedTerm)&media=music"
        return URL(string: urlString)
    }
}

struct SearchResponse: Codable {
    let results: [SearchResult]
}

func performAPISearch() {
    let apiService = APIService()
    apiService.search(term: "rock") { result in
        switch result {
        case .success(let results):
            // API isteği başarılı, sonuçları kullanabilirsiniz
            print("Toplam sonuç sayısı: \(results.count)")
            for result in results {
                print("Sanatçı: \(result.artistName)")
                print("Şarkı: \(result.trackName)")
                print("Önizleme URL'si: \(result.previewUrl)")
                print("---")
            }
        case .failure(let error):
            // API isteği başarısız, hata durumunu işleyebilirsiniz
            print("API hatası: \(error)")
        }
    }
}
