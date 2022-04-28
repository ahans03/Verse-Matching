import SwiftUI

enum Difficulty: String, CaseIterable, Identifiable {
    case easy, normal, hard
    var id: Self {self}
}

struct Home: View {
    @EnvironmentObject var appState: AppState
    @State var difficulty = Difficulty.normal
    @State var showHighScores = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("Home_Image")
                .resizable(resizingMode: .stretch)
                .scaledToFill()
                .edgesIgnoringSafeArea(.vertical)
                .padding(.trailing)
            VStack {
                Text("Memorize Scripture")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Spacer()
                        Text("Select Difficulty")
                        Picker("Difficulty", selection: $difficulty) {
                            ForEach(Difficulty.allCases) { difficulty in
                                Text(difficulty.rawValue.capitalized)
                            }
                        }
                        Spacer()
                    }.foregroundColor(.white)
                    Spacer()
                    Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Spacer()
                        Text("View High Scores")
                        Text("").frame(width: 0, height: 2, alignment: .center)
                        Button("View") {
                            showHighScores.toggle()
                        }.sheet(isPresented: $showHighScores) {
                            HighScores()
                        }
                        Spacer()
                    }.foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                Button {
                    appState.inPlay = true
                } label: {
                    Text("Play")
                        .foregroundColor(.red)
                        .font(.title.bold())
                }
                .frame(width: 100, height: 50, alignment: .center)
                .background(.cyan
                )
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            
    }
}
