//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Igor Manakov on 08.03.2022.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
        
        Text(text)
            .font(.caption)
            .foregroundColor(.white)
            .padding(5)
        }
    }
}

struct CapsuleText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .font(.largeTitle)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct BigModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
    }
}

extension View {
    func bigged() -> some View {
        modifier(BigModifier())
    }
}

struct ContentView: View {
    
    @ViewBuilder var spells: some View {
            Text("Draco dormiens")
            Text("jkladfj")
    }
    
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
            Text("Hello world")
                .titleStyle()
            
            Text("Hello")
                .bigged()
            
            Color(.blue)
                .frame(width: 300, height: 300)
                .watermarked(with: "Igor Manakov")
        }
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
