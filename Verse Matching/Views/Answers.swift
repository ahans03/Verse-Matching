import SwiftUI

func calcGame() -> [Verse] {
    var gameSet: [Verse] = []
    var a = 0, b = 0, c = 0

    let size = VerseData().verses.count - 1
    let correctAnswer = Int.random(in: 0...size)
    repeat {
        a = Int.random(in: 0...size)
    } while a == correctAnswer

    repeat {
        b = Int.random(in: 0...size)
    } while b == correctAnswer || b == a

    repeat {
        c = Int.random(in: 0...size)
    } while c == correctAnswer || c == b || c == a

    gameSet.append(VerseData().verses[a])
    gameSet.append(VerseData().verses[b])
    gameSet.append(VerseData().verses[c])
    gameSet.append(VerseData().verses[correctAnswer])
    return gameSet
}

struct Answers: View {
    var verses: VerseData
    var gameVerses = calcGame()
    @State private var selection: Verse?
    var body: some View {
        
        List(gameVerses, id: \.verse, selection: $selection) { verse in
                AnswerRow(verse: verse)
//                Text(verse.verse)
            
        }
        
        
    }
}

struct Answers_Previews: PreviewProvider {
    static var previews: some View {
        Answers(verses: VerseData())
    }
}
