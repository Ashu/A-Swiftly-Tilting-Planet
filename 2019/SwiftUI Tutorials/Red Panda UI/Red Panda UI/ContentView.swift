//
//  ContentView.swift
//  Red Panda UI
//
//  Created by Caleb Wells on 6/4/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("red panda")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 4))
                .shadow(color: Color.red, radius: 12, x: 0, y: 0)
                .padding(.top, 40)
            
            VStack(alignment: .center, spacing: 0) {
                Text("Red Panda")
                    .font(.title)
                    .padding(.top, 18)
                
                Text("iOS Developer")
                    .color(Color.gray)
                
                Text("""
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    """)
                    .font(.body)
                    .lineLimit(6)
                    .padding(20)
                
                HStack(alignment: .center, spacing: 50) {
                    Text("Languages\nEnglish, French")
                        .padding(.top, 24)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .font(.subheadline)
                    
                    Text("Location\nIdaho")
                        .padding(.top, 24)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .font(.subheadline)
                    
                    Text("Member Since\nJune 3")
                        .padding(.top, 24)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}
