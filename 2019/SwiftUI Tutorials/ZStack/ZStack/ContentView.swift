//
//  ContentView.swift
//  ZStack
//
//  Created by Caleb Wells on 6/4/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfTaps = 0
    
    var body: some View {
        let tap = TapGesture()
            .onEnded { _ in
                self.numberOfTaps += 1
            }
        return ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(tap)
            
            Text("\(numberOfTaps)")
                .color(Color.white)
                .font(.largeTitle)
        }
    }
}
