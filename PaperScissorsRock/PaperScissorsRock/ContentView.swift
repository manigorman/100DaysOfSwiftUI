//
//  ContentView.swift
//  PaperScissorsRock
//
//  Created by Igor Manakov on 09.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentChoise = "🪨"
    
    @State private var shouldWin = false
    @State private var score = 0
    @State private var roundEnds = false
    @State private var alertItem: AlertItem?
    @State private var roundsCount = 0
    
    let moves = ["🪨", "✂️", "🧻"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .secondary]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Spacer()
                
                Text(currentChoise)
                    .font(.system(size: 150))
                
                VStack {
                    HStack(alignment: .center, spacing: 10) {
                        Text(shouldWin ? "Win": "Lose")
                            .font(.title3)
                        Toggle(isOn: $shouldWin) {
                        }
                        .labelsHidden()
                    }
                    
                    ForEach(moves, id: \.self) { move in
                        Button(move) {
                            processPlayerMove(move: move)
                        }
                        .font(.system(size: 100))
                    }
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .shadow(radius: 10)
                
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title)
            }
            .padding()
            .alert(item: $alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: {
                    restartRound()
                }))
            })
        }
    }
    
    func processPlayerMove(move: String) {
        if move == currentChoise {
            alertItem = AlertContext.draw
        }
        else {
            switch move {
            case "🪨":
                if currentChoise == "✂️" && shouldWin || currentChoise == "🧻" && !shouldWin {
                    alertItem = AlertContext.humanWins
                    score += 1
                }
                else {
                    alertItem = AlertContext.computerWins
                }
            case "✂️":
                if currentChoise == "🧻" && shouldWin || currentChoise == "🪨" && !shouldWin {
                    alertItem = AlertContext.humanWins
                    score += 1
                }
                else {
                    alertItem = AlertContext.computerWins
                }
            case "🧻":
                if currentChoise == "🪨" && shouldWin || currentChoise == "✂️" && !shouldWin {
                    alertItem = AlertContext.humanWins
                    score += 1
                }
                else {
                    alertItem = AlertContext.computerWins
                }
            default:
                print("nothing")
            }
        }
        roundEnds = false
        roundsCount += 1
        
        if roundsCount == 10 {
            restartGame()
        }
    }
    
    func restartRound() {
        currentChoise = moves[Int.random(in: 0...2)]
    }
    
    func restartGame() {
        currentChoise = moves[Int.random(in: 0...2)]
        roundsCount = 0
        score = 0
    }
    
    struct AlertItem: Identifiable {
        let id = UUID()
        var title: Text
        var message: Text
        var buttonTitle: Text
    }
    
    struct AlertContext {
        static let humanWins = AlertItem(title: Text("You Win!"),
                                         message: Text("You are so smart. You beat your own AI."),
                                         buttonTitle: Text("Hell Yeah"))
        
        static let computerWins = AlertItem(title: Text("You Lost"),
                                            message: Text("You programmed a super AI."),
                                            buttonTitle: Text("Rematch"))
        
        static let draw = AlertItem(title: Text("Draw"),
                                    message: Text("What a battle..."),
                                    buttonTitle: Text("Try Again"))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
