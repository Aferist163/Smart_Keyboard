//
//  ContentView.swift
//  Smart_Keyboard
//
//  Created by Andrii Struk on 21/02/2025.
//

import SwiftUI

struct ContentView: View {
    func changeColor(color: String) {
        guard let url = URL(string: "http://192.168.0.166:5000/color?value=\(color)") else { return }
        URLSession.shared.dataTask(with: url).resume()
    }
    
    let colors: [(name: String, value: String, color: Color)] = [
        ("Синий", "blue", .blue),
        ("Красный", "red", .red),
        ("Зелёный", "green", .green),
        ("Жёлтый", "yellow", .yellow)
    ]
    
    var body: some View {
        ZStack {
            Color.white // Белый фон
                .ignoresSafeArea() // Чтобы фон был на весь экран
            
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    colorButton(name: colors[0].name, value: colors[0].value, color: colors[0].color)
                    colorButton(name: colors[1].name, value: colors[1].value, color: colors[1].color)
                }
                GridRow {
                    colorButton(name: colors[2].name, value: colors[2].value, color: colors[2].color)
                    colorButton(name: colors[3].name, value: colors[3].value, color: colors[3].color)
                }
            }
            .padding()
        }
    }
    
    func colorButton(name: String, value: String, color: Color) -> some View {
        VStack {
            Button(action: { changeColor(color: value) }) {
                Rectangle()
                    .fill(color)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
