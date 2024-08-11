//
//  Movie.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let title: String
    let poster: String
    let omdbID: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case omdbID = "imdbID"
    }
}
