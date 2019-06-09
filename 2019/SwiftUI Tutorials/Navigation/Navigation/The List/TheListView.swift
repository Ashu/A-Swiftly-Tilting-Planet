//
//  TheListView.swift
//  Navigation
//
//  Created by Caleb Wells on 6/8/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct TheListView : View {
    var body: some View {
        List(0 ..< 5) { item in
            NavigationButton(destination: DetailView()) {
                Image(systemName: "cart.badge.plus")
                    .font(.largeTitle)
                
                CellText()
            }
        }
        .navigationBarTitle(Text("Hello App"))
    }
}

#if DEBUG
struct TheListView_Previews : PreviewProvider {
    static var previews: some View {
        TheListView()
    }
}
#endif
