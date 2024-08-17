//
//  ComposableMoviesAppApp.swift
//  ComposableMoviesApp
//
//  Created by Andersson on 11/08/24.
//

import SwiftUI

@main
struct ComposableMoviesAppApp: App {
    var body: some Scene {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
