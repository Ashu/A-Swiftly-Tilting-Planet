//
//  CellText.swift
//  Navigation
//
//  Created by Caleb Wells on 6/8/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct CellText : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello World")
                .font(.headline)
            
            Text("Hello detail text.")
                .font(.subheadline)
        }
    }
}

#if DEBUG
struct CellText_Previews : PreviewProvider {
    static var previews: some View {
        CellText()
    }
}
#endif
