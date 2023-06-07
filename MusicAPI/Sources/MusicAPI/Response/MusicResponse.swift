//
//  File.swift
//  
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import Foundation

public struct MusicResponse: Decodable {
    public let results: [MusicResult]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let musicModel = try container.decode(MusicModel.self)
        results = musicModel.results
    }
}
