//
//  ContentView.swift
//  MeasureConvert
//
//  Created by Igor Manakov on 08.03.2022.
//

import SwiftUI

//extension UIApplication {
//    func endEditing() {
//        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}

struct ContentView: View {
    
    @FocusState private var inputIsFocused: Bool
    
    @State private var inputNumber: Double = 0.0
    @State private var inputUnit: String = "Celsius"
    @State private var outputUnit: String = "Fahrenheit"
    
    let temperatureInputUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let temperatureOutputUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var outputNumber: String {
        var input = UnitTemperature.celsius
        var output = UnitTemperature.celsius
        
        switch inputUnit {
        case "Celsius":
            input = .celsius
        case "Fahrenheit":
            input = .fahrenheit
        case "Kelvin":
            input = .kelvin
        default:
            break
        }
        
        switch outputUnit {
        case "Celsius":
            output = .celsius
        case "Fahrenheit":
            output = .fahrenheit
        case "Kelvin":
            output = .kelvin
        default:
            break
        }
        
        let temperature = Measurement(value: inputNumber, unit: input)

        let answer = temperature.converted(to: output)
        return String(describing: answer)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter temperature", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(temperatureInputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(temperatureOutputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Input")
                }
                
                Section {
                    Text(outputNumber)
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
//        .onTapGesture {
//            UIApplication.shared.endEditing()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
