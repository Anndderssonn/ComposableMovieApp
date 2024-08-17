//
//  MovieView.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 16/08/24.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 125)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2)
                )
                .shadow(radius: 10)
            Text(movie.title)
        }
    }
}
