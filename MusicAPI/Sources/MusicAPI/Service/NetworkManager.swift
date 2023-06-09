//
//  File.swift
//  
//
//  Created by Gülfem Albayrak on 9.06.2023.
//
import Foundation

enum NetworkError: Error {
    case invalidRequest
    case requestFailed
    case jsonDecodedError
    case customError(Error)

    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return "Invalid Request"
        case .requestFailed:
            return "Request Failed"
        case .jsonDecodedError:
            return "JSON Decoded Error"
        case .customError(let error):
            return error.localizedDescription
        }
    }
}

/// Network service Protocol which network service should be implemented
protocol NetworkService {
    /// Execute Request and returns  response in completion
    /// - Parameters:
    ///     - urlRequest:  request to be executed
    ///     - forceRefresh:  if it is `true` fresh data will be fetched from server. If it is `false` cached data will be used
    ///     - completion: request response in form of `.success(Response)` and `.failure(Error)`
    func execute<T: Decodable>(
        urlRequest: URLRequest,
        completion: @escaping(Result<T, NetworkError>) -> Void
    )
}

public class NetworkManager {
    public let session: URLSession

    init(
        session: URLSession = URLSession(
            configuration: .ephemeral,
            delegate: nil,
            delegateQueue: nil
        )
    ) {
        self.session = session
    }
}

extension NetworkManager: NetworkService {
    
    func execute<T: Decodable>(
        urlRequest: URLRequest,
        completion: @escaping(Result<T, NetworkError>) -> Void
    ) {

        let task = session.dataTask(with: urlRequest) { data, response , error in
            if let error = error {
                completion(.failure(NetworkError.customError(error)))
            } else if let data = data {
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(responseObject))
                } catch {
                    completion(.failure(.jsonDecodedError))
                }
            } else {
                completion(.failure(.requestFailed))
            }
        }
        task.resume()
    }
}

