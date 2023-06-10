//
//  Collection+ extensions.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 9.06.2023.
//

import Foundation
//MARK: - Collections
public extension Collection where Indices.Iterator.Element == Index {
  subscript (safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
