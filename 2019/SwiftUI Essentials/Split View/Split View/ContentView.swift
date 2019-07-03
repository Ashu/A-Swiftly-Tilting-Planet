//
//  ContentView.swift
//  Split View
//
//  Created by Caleb Wells on 7/2/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            ListView()
            DetailView()
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

// Put this in a new .swift file!
struct ListView: View {
    var body: some View {
        List(0 ..< 5) { item in
            NavigationLink(destination: DetailView()) {
                Text("Tap to see more!")
            }
        }.navigationBarTitle("Hello, List!")
    }
}

// Put this in a new .swift file!
struct DetailView: View {
    var body: some View {
        Text("Hello 👋")
    }
}
