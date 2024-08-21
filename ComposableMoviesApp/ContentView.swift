//
//  ContentView.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var search: String = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        Props(movies: state.movies, onSearch: { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        })
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
        VStack {
            TextField("Search", text: $search)
                .onSubmit {
                    props.onSearch(search)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            List(props.movies, id: \.omdbID) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie), label: {
                    MovieView(movie: movie)
                })
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Movies")
        .embedInNavigationView()
    }
}

#Preview {
    let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
    return ContentView().environmentObject(store)
}
