//
//  ContentView.swift
//  TabbedView
//
//  Created by Caleb Wells on 7/2/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabbedView {
            WatchNowView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv.fill")
                        Text("Watch Now")
                    }
                }
                .tag(0)
            
            LibraryView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Library")
                    }
            }
            .tag(1)
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(2)
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

// Make this a new .swift file!
struct WatchNowView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("👋 tab 01!")
            }.navigationBarTitle("Watch Now")
        }
    }
}

// Make this a new .swift file!
struct LibraryView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 15) { item in
                Text("👋 Library!")
            }.navigationBarTitle("Library")
        }
    }
}

// Make this a new .swift file!
struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("🤔")
                .font(.largeTitle)
                .navigationBarTitle("Search")
        }
    }
}
