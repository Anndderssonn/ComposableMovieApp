//
//  StringExtension.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation

extension String {
    func urlEncode() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? self
    }
    
    func toInt() -> Int {
        let ratingDouble = Double(self) ?? 0.0
        return Int(ratingDouble.rounded())
    }
}
