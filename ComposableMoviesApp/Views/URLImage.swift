//
//  URLImage.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject private var imageDownloader: ImageDownloader = ImageDownloader()
    let url: String
    
    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let imageData = self.imageDownloader.downloadedData {
            let img = UIImage(data: imageData)
            return VStack {
                Image(uiImage: img!).resizable()
            }
        } else {
            return VStack {
                Image("no-image").resizable()
            }
        }
    }
}
