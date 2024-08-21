//
//  Webservice.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 16/08/24.
//

import Foundation

class Webservice {
    func getMoviesBy(search: String, completion: @escaping(Result<[Movie]?, NetworkError>) -> Void) {
        guard let moviesURL = URL(string: Constants.Urls.urlBySearch(search: search)) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: moviesURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getMovieDetailsBy(imdbID: String,
                           completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void) {
        guard let moviesURL = URL(string: Constants.Urls.urlForMovieDetailsByOMDBID(omdbID: imdbID))
        else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: moviesURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data)
            completion(.success(movieDetail))
        }.resume()
    }
}
