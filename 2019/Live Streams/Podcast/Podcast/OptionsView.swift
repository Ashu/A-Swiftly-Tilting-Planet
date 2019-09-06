//
//  OptionsView.swift
//  Podcast
//
//  Created by Caleb Wells on 9/6/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        HStack {
            Text("1x")
                .fontWeight(.bold)
            Spacer()
            
            Image(systemName: "airplayaudio")
            Text("AirPods")
            Spacer()
            
            Image(systemName: "ellipsis")
                .font(.largeTitle)
        }.padding()
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
