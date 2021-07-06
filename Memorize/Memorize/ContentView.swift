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
    var emojis = ["✈️", "🚁", "🚂", "🛳"]
    
    var body: some View {
        HStack {
            CardView(content: emojis[0])
            CardView(content: emojis[1])
            CardView(content: emojis[2])
            CardView(content: emojis[3])
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
    

}
// every view is immutable, every change is done by re-creating the UI
struct CardView: View {
    @State var isFaceUp: Bool = false// variables always have to have values
//    @State makes the variabile a pointer to another variabile which changes,
//    the pointer itself is immutalble, the view is re-built whenever it detects
//    a change of the pointed variable
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3) // racetrack
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
                .preferredColorScheme(.dark)
            
            ContentView()
                .preferredColorScheme(.light)
        
        }
    }
}
