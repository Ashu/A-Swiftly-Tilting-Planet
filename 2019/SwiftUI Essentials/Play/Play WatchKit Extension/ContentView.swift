//
//  ContentView.swift
//  Play WatchKit Extension
//
//  Created by Caleb Wells on 7/3/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        List(0 ..< 5) { item in
            NavigationLink(destination: PlayView()) {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Hello World")
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
