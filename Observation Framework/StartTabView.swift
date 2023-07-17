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

struct StartTabView: View {
    @Environment(AppState.self) var appState
    var body: some View {
        @Bindable var appState = appState
        NavigationStack {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "1.circle.fill")
                        Text("Screen 1")
                    }
                WithChildrenView()
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                        Text("Screen 2")
                    }
            }
            .navigationTitle("Observation")
            .toolbar {
                Toggle(appState.isLoggedIn ? "Log Out" : "Log In", isOn: $appState.isLoggedIn)
            }
        }
    }
}

#Preview {
    StartTabView()
        .environment(AppState())
}
