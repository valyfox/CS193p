//
//  ContentView.swift
//  Memorize
//
//  Created by Valerio Volpe on 24/06/21.
//

// LECTURE 2

import SwiftUI

// more smaller views is better than less bigger views

struct ContentView: View {
    var emojis = [/*"✈️",*/ "✈️", "🚁", "🚂", "🛳", "🚗", "🚀", "🚚", "🚖", "🚔", "🚤", "🚙", "🛴", "🛬", "🚡", "🚜", "🚋", "🚇", "🛩", "🚲", "🛵", "🏍", "🚄", "🏎", "🚛"] // must have an id to uniquely identify
//    I can have two trains so I can't identifu a string from another
    @State var emojiCount = 4
    var body: some View {
        VStack {
//            Text(String(emojis.count))
            ScrollView {
                
//                Lazy means that the gid is lazy at accessing the body var of its content view
//                this view can have tousands of cards, creating a view is easy
//                but accessing its body var is expensive as you can access
//                body vars of body vars
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
//                    .adaptive -> put as many as you can with a minimum width of 75
                    
        //            \.self means that I use the string itself to identify the element
        //            This means I can't have the same string (emoji) for two different cards
        //            This is just a workaround for the moment
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in //input varible
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
        // 0..<4 -> 0 to 4 (exclusive)
        // 0...4 -> 0 to 4 (inclusive)
                    }
        //            CardView(content: emojis[1])
        //            CardView(content: emojis[2])
        //            CardView(content: emojis[3])
                }
            }
            .foregroundColor(.green)
            Spacer()
    //        Buttons
                HStack {
                    
                    remove
                    Spacer()
                    add
                }
                .font(.largeTitle)
                .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button { // Action:
            if emojiCount > 1 {
                emojiCount -= 1;
            }
        } label: {
            Image(systemName: "minus.circle")

        }
    }
    
    var add: some View {
        Button { // Action:
            if emojiCount < emojis.count {
            emojiCount += 1;
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}
// every view is immutable, every change is done by re-creating the UI
struct CardView: View {
    @State var isFaceUp: Bool = true // variables always have to have values
//    @State makes the variabile a pointer to another variabile which changes,
//    the pointer itself is immutalble, the view is re-built whenever it detects
//    a change of the pointed variable
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3) // racetrack
//                strokeBorder -> inside
                Text(content)
                        .font(.largeTitle)
                       .foregroundColor(Color.blue)
                       .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

































// glue code for the previewer
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12")
                .preferredColorScheme(.dark)
            
            ContentView()
                .previewDevice("iPhone 12")
                .preferredColorScheme(.light)
        
        }
    }
}
