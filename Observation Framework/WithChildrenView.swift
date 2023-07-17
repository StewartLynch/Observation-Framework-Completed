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

struct WithChildrenView: View {
    @Environment(AppState.self) var appState
    private let name = "Aidan"
    @State private var number = 0
    @State private var isHappy = true
    
    @State private var user = User(name: "Rupert", number: 10)
    var body: some View {
        if appState.isLoggedIn {
            VStack(spacing: 20) {
                HStack1View(name: name, number: $number, isHappy: $isHappy)
                HStack2View(user: user)
            }
            .padding()
        } else {
            ContentUnavailableView("Log In", systemImage: "lock.fill")
        }
    }
}

#Preview {
    WithChildrenView()
        .environment(AppState())
}

struct HStack1View: View {
    let name: String
    @Binding var number: Int
    @Binding var isHappy: Bool
    var body: some View {
        HStack {
            Text("\(name) number:")
            Button {
               number = Int.random(in: 0...9)
            }label: {
                Text(String(number)).bold()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            Toggle("I am happy", isOn: $isHappy)
        }
    }
}

struct HStack2View: View {
    @Bindable var user: User
    var body: some View {
        HStack {
            Menu("\(user.name): \(user.number)") {
                ForEach(10..<20) { num in
                    Button(String(num)) {
                        user.number = num
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            Toggle("I am happy", isOn: $user.isHappy)
        }
    }
}
