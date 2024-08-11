//
//  BundleExtension.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation

extension Bundle {
    class func getConfigValues(key: String) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key) as? String ?? ""
    }
}
