//
//  File.swift
//  
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import Foundation

public struct MusicModel: Decodable {
    public let results: [MusicResult]
}

public struct MusicResult: Decodable {
    public let artistName:String?
    public let collectionName: String?
    public let trackName: String?
    public let previewUrl: String?
    public let artworkUrl100: String?
    public let trackCount: Int?
}
