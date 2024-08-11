//
//  ViewExtension.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
