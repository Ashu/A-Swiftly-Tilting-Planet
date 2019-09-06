//
//  ContentView.swift
//  Podcast
//
//  Created by Caleb Wells on 9/6/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Swift Podcast")
                .resizable()
            .cornerRadius(12)
                .scaledToFit()
                .padding(.horizontal)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(.secondary)
                    .frame(width: 380, height: 4)
                
                Capsule()
                    .foregroundColor(.primary)
                    .frame(width: 72, height: 4)
                
                Circle()
                    .foregroundColor(.primary)
                    .frame(width: 8, height: 8)
                    .padding(.leading, 69)
            }.padding(.top)
            
            HStack {
                Text("27:42")
                Spacer()
                Text("-42:27")
            }.padding(.horizontal)
            
            Text("Hello World")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Interview with the Developer")
                .font(.title)
            
            PlayView()
            
            VolumeView()
            
            OptionsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.colorScheme, .dark)
    }
}
