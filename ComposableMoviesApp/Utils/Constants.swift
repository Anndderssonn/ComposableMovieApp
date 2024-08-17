//
//  Constants.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation

struct Constants {
    private static let apiKey = ""
    private static let domainURL = "https://www.omdbapi.com"
    
    struct Urls {
        static func urlBySearch(search: String) -> String {
            "\(domainURL)/?s=\(search)&page=1&apikey=\(apiKey)"
        }
        
        static func urlForMovieDetailsByOMDBID(omdbID: String) -> String {
            "\(domainURL)/?i=\(omdbID)&apikey=\(apiKey)"
        }
    }
}
