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
    
    let colors: [(value: String, color: Color)] = [
            ("red", Color(#colorLiteral(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))),
            ("orange", Color(#colorLiteral(red: 1, green: 0.4873002615, blue: 0.001315790044, alpha: 1))),
            ("yellow", Color(#colorLiteral(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0))),
            ("light green", Color(#colorLiteral(red: 0.7590737098, green: 1, blue: 0.1726049846, alpha: 1))),
            ("blue", Color(#colorLiteral(red: 0, green: 0.01396386574, blue: 1, alpha: 1))),
            ("light blue", Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
            ("blue_lighGreen", Color(#colorLiteral(red: 0, green: 1, blue: 0.6773500971, alpha: 1))),
            ("green", Color(#colorLiteral(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0))),
            ("purple", Color(#colorLiteral(red: 0.4877579828, green: 0, blue: 1, alpha: 1))),
            ("purple_pink", Color(#colorLiteral(red: 0.7841505162, green: 0, blue: 1, alpha: 1))),
            ("pink", Color(#colorLiteral(red: 1, green: 0, blue: 0.9317503674, alpha: 1))),
            ("pink_red", Color(#colorLiteral(red: 1, green: 0, blue: 0.5411865382, alpha: 1)))
        ]
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1803921569, green: 0.1568627451, blue: 0.1568627451, alpha: 1)),Color(#colorLiteral(red: 0.6509803922, green: 0.6509803922, blue: 0.6509803922, alpha: 1))]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 1)),Color(#colorLiteral(red: 0.3485834912, green: 0.1700546396, blue: 0.1863969462, alpha: 1))]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        colorButton(value: colors[0].value, color: colors[0].color)
                        colorButton(value: colors[1].value, color: colors[1].color)
                        colorButton(value: colors[2].value, color: colors[2].color)
                        colorButton(value: colors[3].value, color: colors[3].color)
                    }
                    GridRow {
                        colorButton(value: colors[4].value, color: colors[4].color)
                        colorButton(value: colors[5].value, color: colors[5].color)
                        colorButton(value: colors[6].value, color: colors[6].color)
                        colorButton(value: colors[7].value, color: colors[7].color)
                    }
                    GridRow {
                        colorButton(value: colors[8].value, color: colors[8].color)
                        colorButton(value: colors[9].value, color: colors[9].color)
                        colorButton(value: colors[10].value, color: colors[10].color)
                        colorButton(value: colors[11].value, color: colors[11].color)
                    }
                }
                .padding(12)
            }
            .cornerRadius(30)
            .frame(width: 336, height: 249)
            .shadow(color: .black, radius: 2, x: 0, y: 4)
        }
    }
    
    
    func colorButton( value: String, color: Color) -> some View {
        VStack {
            Button(action: { changeColor(color: value) }) {
                Rectangle()
                    .fill(color)
                    .frame(width: 75, height: 75)
                    .cornerRadius(20)
            }
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
