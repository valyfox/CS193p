//
//  ContentView.swift
//  Memorize
//
//  Created by Valerio Volpe on 24/06/21.
//

// LECTURE 1

import SwiftUI

// functional programming
struct ContentView: View { //View: the struct behaves like a view
//    I get all the functionality of a view, but also all the responsibility
    var body: some View {
        //a view must implement this variabile
        //        some View is the type of the variabile
        //        body is some other view
        //        a chair made of lego is itself a lego
        //        body is a combiner view
        //        body is a function that does not a name and no input parameters, it returns a Text (the return keyword is hidden
        //        body is calculated every time by executinf the function
                
        //        /*(*/return/*)*/ Text("Hellooooo, wooooorld!")
        //            .foregroundColor(Color.blue) //Text is another struct
        //            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) //View modifier
            
//        return RoundedRectangle(cornerRadius: 20)
//            .stroke(lineWidth: 3)
//            .padding(.horizontal)
//            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            
        return ZStack {
            RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 3)
            
            Text("Hellooooo, wooooorld!")
                        .foregroundColor(Color.blue) //Text is another struct
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) //View modifier
//            I can also declare variabiles and us if statements
        }
//        Last argument can be outside the parethesis
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/) //default color for the views inside the container
    }
    
//    func foo() {
//      structures can have functions
//    }
}



































// glue code for the previewer
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
