//
//  MoviesMiddleware.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 16/08/24.
//

import Foundation

func moviesMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case let action as FetchMovies:
            Webservice().getMoviesBy(search: action.search.urlEncode()) { result in
                switch result {
                case .success(let movies):
                    if let movies = movies {
                        dispatch(SetMovies(movies: movies))
                    }
                case .failure(let error):
                    print("Middleware Movies error: \(error.localizedDescription)")
                }
            }
        case let action as FetchMovieDetail:
            Webservice().getMovieDetailsBy(imdbID: action.imdbID) { result in
                switch result {
                case .success(let details):
                    if let details = details {
                        dispatch(SetMovieDetail(details: details))
                    }
                case .failure(let error):
                    print("Middleware Movie Detail error: \(error.localizedDescription)")
                }
            }
        default:
            break
        }
    }
}
