//
//  PlayView.swift
//  Podcast
//
//  Created by Caleb Wells on 9/6/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        HStack {
            Image(systemName: "gobackward.15")
                .font(.system(size: 24))
            Spacer()
            
            Image(systemName: "pause.fill")
                .font(.system(size: 64))
            Spacer()
            
            Image(systemName: "goforward.15")
                .font(.system(size: 24))
        }.padding(.horizontal, 64)
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
