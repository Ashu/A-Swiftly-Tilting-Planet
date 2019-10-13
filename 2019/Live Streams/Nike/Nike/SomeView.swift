//
//  SomeView.swift
//  Nike
//
//  Created by Caleb Wells on 10/10/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct SomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            HStack {
                Image(systemName: "tray.2.fill")
                Text("Hello World!")
            }
        }
        .navigationBarTitle("Some View")
        .edgesIgnoringSafeArea(.all)
    }
}

struct SomeView_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
}
