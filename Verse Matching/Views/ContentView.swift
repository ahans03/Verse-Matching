//
//  ContentView.swift
//  Verse Matching
//
//  Created by Anthony Hanson on 3/29/22.
//

import SwiftUI

struct Verse: Codable, Hashable{
    var loc: String
    var verse: String
}

class VerseData {
    var verses: [Verse] = load("verses.json")
    var easy: [Verse] = load("smallVerseSample.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var verses = VerseData().verses.shuffled()
    @State private var easy = VerseData().easy.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var scoreStr = ""
    @State private var showingScore = false
    @State private var lives = 3
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("Image")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 0) {
                Text("\(verses[correctAnswer].verse)")
                    .lineLimit(10)
                    .font(.title2.bold().italic())
                    .foregroundColor(Color.yellow)
                    .padding()
                    .background(
                        Rectangle()
                            .fill(.black)
                            .opacity(0.5)
                    )
                    .padding()
                Spacer()
                
                ForEach(0..<4) { i in
                    Button{
                        versePicked(i)
                    } label: {
                        Text(verses[i].loc)
//                        AnswerRow(verse: verses[i])
                    }
                    .font(.title3.bold())
                    .padding(5)
                    .foregroundColor(.black)
                    .background(
                        ZStack {
                            Color.red
                            Color.blue
                                .opacity(0.2)
                        }
                    )
                    .opacity(0.7)
                    .padding(5)
                }
                Spacer()
                Spacer()
                HStack {
                    Spacer()
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                        .background(.black)
                    Spacer()
                    HStack {
                        Text("    Tries\nremaining")
                            .foregroundColor(.white)
                        Text(": \(lives)")
                            .foregroundColor(.white)
                            .font(.title.bold())
                    }.background(.black)
                    Spacer()
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: start)
        } message: {
            Text(scoreStr)
        }
    }
    
    func versePicked(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreStr = "Your score is \(score) + 1"
            score += 1
        } else {
            scoreTitle = "Sorry... \(verses[number].loc) says: "
            scoreStr = "\(verses[number].verse)"
            lives -= 1
        }
        showingScore = true
        if lives == 0 {
            appState.inPlay = false
        }
    }
    func start() {
        verses.shuffle()
        correctAnswer = Int.random(in: 0...3)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
