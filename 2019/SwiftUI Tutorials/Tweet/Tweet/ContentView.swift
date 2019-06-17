//
//  ContentView.swift
//  Tweet
//
//  Created by Caleb Wells on 6/17/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 8) { item in
                Tweet()
            }
            .navigationBarTitle(Text("Hello, Tweets"))
        }
    }
}

struct Tweet: View {
    var body: some View {
        HStack {
            Image("girl-919048_640")
                .resizable()
                .frame(width: 80, height: 60)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text("Name")
                    .bold()
                
                Text("Hi this is a tweet text or something.\nSome more text. 🤯")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 1)
                    .lineLimit(4)
                
                HStack() {
                    Image(systemName: "bubble.left")
                        .padding()
                    
                    Image(systemName: "arrow.2.squarepath")
                        .padding()
                    
                    Image(systemName: "heart")
                        .padding()
                    
                    Image(systemName: "square.and.arrow.up")
                        .padding()
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
