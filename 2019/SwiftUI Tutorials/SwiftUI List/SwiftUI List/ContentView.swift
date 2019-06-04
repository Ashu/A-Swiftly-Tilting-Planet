//
//  ContentView.swift
//  SwiftUI List
//
//  Created by Caleb Wells on 6/3/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

let items = ["WWDC19", "Swift!!", "Apple!!!"]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text(items[0])
                Text(items[1])
                Text(items[2])
            }
            .navigationBarTitle(Text("Hello, SwiftUI!!"))
        }
    }
}
