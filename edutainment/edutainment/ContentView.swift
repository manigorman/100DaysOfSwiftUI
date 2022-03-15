//
//  ContentView.swift
//  edutainment
//
//  Created by Igor Manakov on 12.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tableLevel = 2
    @State private var questionsCount = 5
    @State private var answer = ""
    @FocusState private var isInputActive: Bool
    @State private var generate = false
    
    private var questionsOptions = [5, 10, 15]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Stepper ("Level: \(tableLevel)", value: $tableLevel, in: 2...12)
                    
                    Picker("How many questions?", selection: $questionsCount) {
                        ForEach(questionsOptions, id: \.self) { option in
                            Text("\(option) questions")
                        }
                    }
                    
                    Button("Generate tasks") {
                        generate = true
                    }
                    
                } header: {
                    Text("Settings")
                }
                
                if generate {
                    Section {
                        Text("\(Int.random(in: 2...tableLevel)) * \(Int.random(in: 2...tableLevel)) =")
                        TextField("Enter an answer", text: $answer)
                            .keyboardType(.numberPad)
                            .focused($isInputActive)
                    }
                }
            }
            .navigationTitle("Edutainment")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Enter") {
                        checkAnswer(answer: answer)
                        isInputActive = false
                    }
                }
            }
        }
    }
    
    func checkAnswer(answer: String) {
        guard let number = Int(answer) else {return}
        print(number)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
