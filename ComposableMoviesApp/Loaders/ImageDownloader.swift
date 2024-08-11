//
//  ImageDownloader.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation

class ImageDownloader: ObservableObject {
    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is incorrect")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
}
