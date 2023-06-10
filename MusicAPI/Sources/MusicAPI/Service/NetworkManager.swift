////
////  File.swift
////  
////
////  Created by Gülfem Albayrak on 9.06.2023.
////
//import Foundation
//
//enum NetworkError: Error {
//    case invalidURL
//    case requestFailed(Error)
//    case invalidResponse
//    case jsonDecodingFailed(Error)
//}
//
//protocol NetworkService {
//    func fetchData(with url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
//}
//
//final class NetworkManager: NetworkService {
//    func fetchData(with url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(.requestFailed(error)))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard 200..<300 ~= httpResponse.statusCode else {
//                let error = NSError(
//                    domain: NSURLErrorDomain,
//                    code: httpResponse.statusCode,
//                    userInfo: [NSLocalizedDescriptionKey: HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode)]
//                )
//                completion(.failure(.requestFailed(error)))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            completion(.success(data))
//        }
//
//        task.resume()
//    }
//}
