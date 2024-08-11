//
//  Constants.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation

struct Constants {
    private static let apiKey = Bundle.getConfigValues(key: "API_KEY")
    private static let domainURL = Bundle.getConfigValues(key: "BASE_URL")
    
    struct Urls {
        static func urlBySearch(search: String) -> String {
            "\(domainURL)/?s=\(search)&page=1&apikey=\(apiKey)"
        }
        
        static func urlForMovieDetailsByOMDBID(omdbID: String) -> String {
            "\(domainURL)/?i=\(omdbID)&apikey=\(apiKey)"
        }
    }
}
