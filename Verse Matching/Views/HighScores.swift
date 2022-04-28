import SwiftUI

struct HighScores: View {
    @Environment(\.dismiss) var dismiss
//    var scores : Array
    
    var body: some View {
        VStack {
            List{
                ForEach(0..<10) {i in
                    Text("player: <score>")
                }
            }
            Button("OK"){
                dismiss()
            }
        }        
    }
}

struct HighScores_Previews: PreviewProvider {
    static var previews: some View {
        HighScores()
    }
}
