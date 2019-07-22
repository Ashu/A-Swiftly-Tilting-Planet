//
//  MoreAppScreenShotsView.swift
//  Ratings & Reviews
//
//  Created by Caleb Wells on 7/21/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct MoreAppScreenShotsView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "rectangle")
                    .rotationEffect(Angle(degrees: 90))
                
                Text("Offers iPad App")
                Spacer()
                Image(systemName: "chevron.down")
            }
                .padding()
            
            Divider()
        }
    }
}

#if DEBUG
struct MoreAppScreenShotsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreAppScreenShotsView()
    }
}
#endif
