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
                    print("Middleware error: \(error.localizedDescription)")
                }
            }
        default:
            break
        }
    }
}
