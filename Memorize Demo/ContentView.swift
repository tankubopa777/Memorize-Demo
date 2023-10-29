//
//  ContentView.swift
//  Memorize Demo
//
//  Created by warunporn intarachana on 10/10/2566 BE.
//
import SwiftUI

struct ContentView: View {
    let themes: [Theme] = [
        Theme(symbol: "globe.central.south.asia", name: "Country", emojis: ["🇹🇭", "🇯🇵", "🇰🇷", "🇺🇸", "🇬🇧", "🇫🇷", "🇨🇳", "🇮🇳", "🇹🇭", "🇯🇵", "🇰🇷", "🇺🇸", "🇬🇧", "🇫🇷", "🇨🇳", "🇮🇳"])
,
        Theme(symbol: "car.fill",name:"car" ,emojis: ["🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🚒", "🚜","🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🚒", "🚜"]),
        Theme(symbol: "briefcase.fill",name:"career" ,emojis: ["👮‍♂️", "👩‍🍳", "👨‍🌾", "👩‍🔬", "👨‍🎨", "👩‍🚀", "👨‍🔧", "👩‍⚖️","👮‍♂️", "👩‍🍳", "👨‍🌾", "👩‍🔬", "👨‍🎨", "👩‍🚀", "👨‍🔧", "👩‍⚖️"])
    ]
    
    @State private var currentThemeIndex = 0
//  add this state for change theme icon when selected.
    @State private var isThemeSelected: [Bool] = [true, false, false]
    @State var cardCount = 4
    
    
    var body: some View {
            VStack {
                Spacer(minLength: 0)
                Text("Memorize!")
                    .font(.largeTitle)
                    .padding(.horizontal)
                    .foregroundColor(.red)
                    .bold()
                
                let currentEmojis = Array(themes[currentThemeIndex].emojis.shuffled().prefix(16))  // random 16 emojis
                

                ForEach(0..<4, id: \.self) { row in
                    HStack(spacing: 8) { // add space for each card
                        ForEach(0..<4, id: \.self) { column in
                            CardView(content: currentEmojis[row * 4 + column])
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                .foregroundColor(.pink)

                
                HStack {
                    ForEach(themes.indices, id: \.self) { index in
                        Button(action: {
                            currentThemeIndex = index
                            cardCount = 4
                            isThemeSelected = Array(repeating: false, count: themes.count)
                            isThemeSelected[index] = true
                        }) {
                            VStack {
//                              check theme is selelcted if not is will be ? icon
                                Image(systemName: isThemeSelected[index] ? themes[index].symbol : "questionmark.circle")
                                    .font(.largeTitle)
                                Text(isThemeSelected[index] ? themes[index].name : "Theme\(index + 1)")
                            }
                            .foregroundColor(.red)
                        }
                        .padding(.horizontal)

                               }
                           }
            }
            .padding()
        }
}

//Theme template
struct Theme {
    var symbol: String
    var name: String
    var emojis: [String]
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
