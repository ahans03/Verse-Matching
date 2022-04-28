//
//  Verse_MatchingApp.swift
//  Verse Matching
//
//  Created by Anthony Hanson on 3/29/22.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var inPlay: Bool
    
    init(inPlay: Bool) {
        self.inPlay = inPlay
    }
}

//class Diff : ObservableObject {
//    @Published var difficulty: String
//
//    init(difficulty: String) {
//        self.difficulty = difficulty
//    }
//}

@main
struct Verse_MatchingApp: App {
    @ObservedObject var appState = AppState(inPlay: false)
//    @ObservedObject var difficulty = Difficulty(difficulty: "normal")
//    @ObservedObject var showHighScores = ShowHighScores(show: false)
    var body: some Scene {
        WindowGroup {
            if appState.inPlay {
                ContentView()
                    .environmentObject(appState)
//                    .environmentObject(difficulty)
            }  else {
                Home()
                    .environmentObject(appState)
//                    .environmentObject(difficulty)
                
            }
        }
    }
}
