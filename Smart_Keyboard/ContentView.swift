//
//  ContentView.swift
//  Smart_Keyboard
//
//  Created by Andrii Struk on 21/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSwitchOn = true
    @State private var selectedColor: String = "white"
    @State private var MemoryColor: String = "white"
    @State private var sliderValue: Double = 100.0
    
    @State private var sliderOffset: CGFloat = 0
    @State private var sliderHeight: CGFloat = 260
    @State private var sliderValueWhite: Int = 100

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
    
    func getColor(from colorString: String) -> Color {
        switch colorString {
        case "red":
            return Color(#colorLiteral(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        case "orange":
            return Color(#colorLiteral(red: 1, green: 0.4873002615, blue: 0.001315790044, alpha: 1))
        case "yellow":
            return Color(#colorLiteral(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0))
        case "light green":
            return Color(#colorLiteral(red: 0.7590737098, green: 1, blue: 0.1726049846, alpha: 1))
        case "blue":
            return Color(#colorLiteral(red: 0, green: 0.01396386574, blue: 1, alpha: 1))
        case "light blue":
            return Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        case "blue_lighGreen":
            return Color(#colorLiteral(red: 0, green: 1, blue: 0.6773500971, alpha: 1))
        case "green":
            return Color(#colorLiteral(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0))
        case "purple":
            return Color(#colorLiteral(red: 0.4877579828, green: 0, blue: 1, alpha: 1))
        case "purple_pink":
            return Color(#colorLiteral(red: 0.7841505162, green: 0, blue: 1, alpha: 1))
        case "pink":
            return Color(#colorLiteral(red: 1, green: 0, blue: 0.9317503674, alpha: 1))
        case "pink_red":
            return Color(#colorLiteral(red: 1, green: 0, blue: 0.5411865382, alpha: 1))
        case "white":
            return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        case "black":
            return Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        default:
            return .white
        }
    }

    func colorButton(value: String, color: Color) -> some View {
        VStack {
            Button(action: { changeColor(color: value) }) {
                Rectangle()
                    .fill(color)
                    .frame(width: 75, height: 75)
                    .cornerRadius(20)
            }
        }
    }
    
    func sendColorAndSliderValueRequest(color: String, sliderValue: Double, sliderValueWhite: Int) {
        
       
        let sliderValueString = String(format: "%.0f", sliderValue)
        let sliderValueWhiteString = String(format: "%.0f", sliderValueWhite)
        
        guard let url = URL(string: "http://192.168.0.166:5000/color?value=\(color)&sliderValue=\(sliderValueString)&sliderValueWhite=\(sliderValueWhiteString)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url).resume()
    }
    
    func switchBlack(color: String) {
        sendColorAndSliderValueRequest(color: selectedColor, sliderValue: sliderValue, sliderValueWhite: sliderValueWhite)
    }
    
    // Функция для изменения яркости
    func sliderValueChanged() {
        if !isSwitchOn {
               return
           }
        sendColorAndSliderValueRequest(color: selectedColor, sliderValue: sliderValue, sliderValueWhite: sliderValueWhite)
    }
    
    // Функция для изменения цвета
    func changeColor(color: String) {
        if !isSwitchOn {
               return
           }
        selectedColor = color
        sendColorAndSliderValueRequest(color: color, sliderValue: sliderValue, sliderValueWhite: sliderValueWhite)
    }
    
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
                                            selectedColor = MemoryColor
                                            switchBlack(color: MemoryColor )
                                        } else {
                                            MemoryColor = selectedColor
                                            selectedColor = "black"
                                            switchBlack(color: selectedColor)
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
                                    .contentTransition(.numericText())
                            Spacer()
                            
                            Slider(value: $sliderValue, in: 0...100, step: 1)
                                .padding(.trailing, 25)
                                .onChange(of: sliderValue) { newValue in
                                    sliderValueChanged()
                                }
                        }
                        .padding(.bottom, 20)
                    }
                }
                .frame(height: 250)
                .cornerRadius(60)
                .shadow(color: Color(#colorLiteral(red: 0.1784051452, green: 0.1784051452, blue: 0.1784051452, alpha: 1)), radius: 20, x: 0, y: 8)
                
                Spacer()
                
                HStack {
                    
                    ZStack {
                        Image("key")
                            .resizable()
                            .frame(width: 136, height: 119)
                            .padding(.leading, 70)
                            .shadow(color: Color(#colorLiteral(red: 0.1784051452, green: 0.1784051452, blue: 0.1784051452, alpha: 1)), radius: 20, x: 0, y: 8)
                        
                        Rectangle()
                            .fill(getColor(from: selectedColor))
                            .frame(width: 50, height: 50)
                            .padding(.leading, 35)
                            .padding(.bottom, 45)
                        
                        Image("key")
                            .resizable()
                            .frame(width: 136, height: 119)
                            .padding(.leading, 70)
                    }
                    Spacer()
                    
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .frame(width: 50, height: 260)
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                                        getColor(from: selectedColor)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )

                        Rectangle().frame(width: 50, height: min(260, max(0, sliderHeight + sliderOffset)))
                            .foregroundColor( Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.4))
                            .gesture(
                                DragGesture()
                                    .onChanged({value in
                                        sliderValueChanged()
                                        withAnimation{
                                            sliderOffset = -value.translation.height * 1.2
                                            let newHEIGHT = min(260, max(0, sliderHeight + sliderOffset))
                                            sliderValueWhite = Int((newHEIGHT / 260) * 100)
                                        }
                                    })
                                    .onEnded({value in
                                        sliderHeight = min(260, max(10, sliderHeight + sliderOffset))
                                        sliderOffset = 0
                                    })
                            )
                    }
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.trailing, 5)
                    .frame(height: 260)
                    //.overlay{
                      //  Text("\(sliderValueWhite)")
                        //    .font(.largeTitle)
                          //  .foregroundColor(.white)
                            //.contentTransition(.numericText())
                    //}
                    
                }
                .frame(height: 280)
                .padding(16)
                
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
                }
                .cornerRadius(20)
                .frame(width: 336 + 24, height: 249 + 24)
                .shadow(color: Color(#colorLiteral(red: 0.1784051452, green: 0.1784051452, blue: 0.1784051452, alpha: 1)), radius: 2, x: 0, y: 6)
                .padding(.bottom, 24)
            }
        }.ignoresSafeArea()
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
