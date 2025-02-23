//
//  ContentView.swift
//  Smart_Keyboard
//
//  Created by Andrii Struk on 21/02/2025.
//

import SwiftUI

struct ContentView: View {
    func changeColor(color: String) {
        if !isSwitchOn {
            guard let url = URL(string: "http://192.168.0.166:5000/color?value=black") else { return }
            URLSession.shared.dataTask(with: url).resume()
        } else {
            guard let url = URL(string: "http://192.168.0.166:5000/color?value=\(color)") else { return }
            URLSession.shared.dataTask(with: url).resume()
        }
    }
    
    @State private var isSwitchOn = false
    @State private var sliderValue: Double = 50.0

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
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1803921569, green: 0.1568627451, blue: 0.1568627451, alpha: 1)), Color(#colorLiteral(red: 0.6509803922, green: 0.6509803922, blue: 0.6509803922, alpha: 1))]),
                startPoint: .top,
                endPoint: .bottom
            )

            VStack {
                
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01176470588, green: 0.1960784314, blue: 0.137254902, alpha: 1)), Color(#colorLiteral(red: 0.0862745098, green: 0.2862745098, blue: 0.02352941176, alpha: 1)), Color(#colorLiteral(red: 0.4745098039, green: 0.4588235294, blue: 0.007843137255, alpha: 1))]),
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                    VStack{
                        HStack {
                            Image("Keyboard_icon")
                                .resizable()
                                .frame(width: 53, height: 49)
                                .padding(20)
                            
                            VStack(alignment: .leading) {
                                Text("Smart")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                Text("Keyboard")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                            Spacer()
                            
                            Toggle("", isOn: $isSwitchOn)
                                    .labelsHidden()
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                    .onChange(of: isSwitchOn) { newValue in
                                        if newValue {
                                            changeColor(color: "white")
                                        } else {
                                            changeColor(color: "black")
                                        }
                                    }

                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 90)
                        
                        Spacer();
                        
                        HStack{
                            Text("\(Int(sliderValue))")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 80)
                                .padding(.leading, 15)
                            Spacer()
                            
                            Slider(value: $sliderValue, in: 0...100, step: 1)
                                .padding(.trailing, 25)
                        }
                        .padding(.bottom, 20)
                    }
                }
                .frame(height: 250)
                .cornerRadius(60)
                .shadow(color: Color(#colorLiteral(red: 0.1784051452, green: 0.1784051452, blue: 0.1784051452, alpha: 1)), radius: 20, x: 0, y: 8)


                Spacer()

                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 1)), Color(#colorLiteral(red: 0.3485834912, green: 0.1700546396, blue: 0.1863969462, alpha: 1))]),
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
                .padding(.bottom, 70)
                .frame(width: 336, height: 249)
                .shadow(color: Color(#colorLiteral(red: 0.1784051452, green: 0.1784051452, blue: 0.1784051452, alpha: 1)), radius: 2, x: 0, y: 6)
            }
        }.ignoresSafeArea()
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
