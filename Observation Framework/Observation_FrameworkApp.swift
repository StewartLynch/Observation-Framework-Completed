//
// Created for Observation Framework
// by  Stewart Lynch on 2023-07-16
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

@main
struct Observation_FrameworkApp: App {
    @State private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            StartTabView()
                .environment(appState)
        }
    }
}
