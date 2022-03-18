//
//  ContentView.swift
//  Drawing
//
//  Created by Igor Manakov on 18.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Text("Hello, comrad!")
            
            Rectangle()
                .fill(.red)
                .blendMode(
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
