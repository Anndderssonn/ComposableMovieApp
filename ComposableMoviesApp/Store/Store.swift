//
//  Store.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation

typealias Dispatcher = (Action) -> Void
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState {}
protocol Action {}

struct AppState: ReduxState {
    var movies = MoviesState()
}

struct MoviesState: ReduxState {
    var movies = [Movie]()
    var selectedMovieDetail: MovieDetail?
}

struct FetchMovies: Action {
    let search: String
}

struct SetMovies: Action {
    let movies: [Movie]
}

struct FetchMovieDetail: Action {
    let imdbID: String
}

struct SetMovieDetail: Action {
    let details: MovieDetail
}

class Store<StoreState: ReduxState>: ObservableObject {
    @Published var state: StoreState
    var reducer: Reducer<StoreState>
    var middleware: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState,
         middlewares: [Middleware<StoreState>] = [])
    {
        self.reducer = reducer
        self.state = state
        self.middleware = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middleware.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
