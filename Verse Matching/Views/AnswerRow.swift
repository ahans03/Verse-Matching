//
//  Answers.swift
//  Verse Matching
//
//  Created by Anthony Hanson on 4/6/22.
//

import SwiftUI

struct AnswerRow: View {
    var verse: Verse
    @State var selected = false
    
    var body: some View {
        HStack {
            Spacer()
//            Toggle(isOn: $selected) {
                Text(verse.loc)
                    .font(.title2.bold())
//            }
//            .toggleStyle(.button)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var verses = VerseData().verses
    
    static var previews: some View {
        Group {
            AnswerRow(verse: verses[0])
            AnswerRow(verse: verses[1])
        }
        .previewLayout(.fixed(width: 250, height: 50))
    }
}
