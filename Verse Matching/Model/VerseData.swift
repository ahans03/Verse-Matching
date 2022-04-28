////
////  VerseData.swift
////  Verse Matching
////
////  Created by Anthony Hanson on 3/31/22.
////
//
//import Foundation
//import Combine
//
//
//
//struct Verse: Codable, Hashable{
//    var loc: String
//    var verse: String
//}
//
////func calcGame() -> [Verse] {
////    var gameSet: [Verse] = []
////    var a = 0, b = 0, c = 0
////
////    let size = VerseData().verses.count - 1
////    let correctAnswer = Int.random(in: 0...size)
////    repeat {
////        a = Int.random(in: 0...size)
////    } while a == correctAnswer
////
////    repeat {
////        b = Int.random(in: 0...size)
////    } while b == correctAnswer || b == a
////
////    repeat {
////        c = Int.random(in: 0...size)
////    } while c == correctAnswer || c == b || c == a
////
////    gameSet.append(VerseData().verses[a])
////    gameSet.append(VerseData().verses[b])
////    gameSet.append(VerseData().verses[c])
////    gameSet.append(VerseData().verses[correctAnswer])
////    return gameSet
////}
//
//class VerseData: ObservableObject{
//
//    @Published var verses: [Verse] = load("verses.json")
//    
////    @Published var gameSet: [Verse] = [VerseData().verses[1], VerseData().verses[1], VerseData().verses[1], VerseData().verses[1]]
// 
//}
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
