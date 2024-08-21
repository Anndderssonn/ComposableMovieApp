//
//  MovieDetailView.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 20/08/24.
//

import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject var store: Store<AppState>
    let movie: Movie
    
    struct Props {
        let details: MovieDetail?
        let onLoadMovieDetails: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        Props(details: state.selectedMovieDetail, onLoadMovieDetails: { imdbID in
            store.dispatch(action: FetchMovieDetail(imdbID: imdbID))
        })
    }
    var body: some View {
        VStack {
            let props = map(state: store.state.movies)
            Group {
                if let details = props.details {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            URLImage(url: details.poster)
                            Spacer()
                        }
                        Text(details.title).padding(5).font(.title)
                        Text(details.plot).padding(5)
                        HStack {
                            Text("Rating")
                            RatingView(rating: .constant(details.imdbRating.toInt()))
                        }.padding()
                        Spacer()
                    }
                } else {
                    Text("Loading...")
                }
            }
            .onAppear(perform: {
                props.onLoadMovieDetails(movie.omdbID)
            })
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(title: "", poster: "", omdbID: ""))
}
