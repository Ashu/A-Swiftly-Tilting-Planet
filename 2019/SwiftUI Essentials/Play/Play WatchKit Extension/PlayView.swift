//
//  PlayView.swift
//  Play WatchKit Extension
//
//  Created by Caleb Wells on 7/3/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .font(.title)
            
            Text("Artist")
            
            HStack {
                Image(systemName: "backward.fill")
                Spacer()
                
                Image(systemName: "pause.fill")
                    .font(.largeTitle)
                Spacer()
                
                Image(systemName: "forward.fill")
            }.padding(.horizontal, 22)
            
            Spacer()
            Image(systemName: "volume.2.fill")
                .font(.title)
        }
    }
}

#if DEBUG
struct PlayView_Previews : PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
#endif
