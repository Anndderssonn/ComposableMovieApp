//
//  RatingView.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundStyle(Color.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}
