//
//  RatingsScrollView.swift
//  Ratings & Reviews
//
//  Created by Caleb Wells on 7/21/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct RatingsScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                RatingBoxView()
                    .frame(width: 370, height: 260, alignment: .leading)
                RatingBoxView()
                    .frame(width: 370, height: 260, alignment: .leading)
                RatingBoxView()
                    .frame(width: 370, height: 260, alignment: .leading)
            }
        }
    }
}

#if DEBUG
struct RatingsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsScrollView()
    }
}
#endif
