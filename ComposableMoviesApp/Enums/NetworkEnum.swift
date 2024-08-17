//
//  NetworkEnum.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 16/08/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}
