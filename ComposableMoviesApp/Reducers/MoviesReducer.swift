//
//  MoviesReducer.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 16/08/24.
//

import Foundation

func moviesReducer(_ state: MoviesState, _ action: Action) -> MoviesState {
    var state = state
    switch action {
    case let action as SetMovies:
        state.movies = action.movies
    case let action as SetMovieDetail:
        state.selectedMovieDetail = action.details
    default:
        break
    }
    return state
}
