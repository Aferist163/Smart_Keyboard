//
//  ContentView.swift
//  Smart_Keyboard
//
//  Created by Andrii Struk on 21/02/2025.
//

import SwiftUI

struct ContentView: View {
    func changeColor(color: String) {
        guard let url = URL(string: "http://192.168.1.100:5000/color?value=\(color)") else { return }
        URLSession.shared.dataTask(with: url).resume()
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: { changeColor(color: "blue") }) {
                Text("Синий")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Button(action: { changeColor(color: "red") }) {
                Text("Красный")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
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
