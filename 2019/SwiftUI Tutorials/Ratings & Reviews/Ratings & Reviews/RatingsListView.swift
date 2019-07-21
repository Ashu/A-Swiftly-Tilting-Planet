//
//  AppListView.swift
//  Ratings & Reviews
//
//  Created by Caleb Wells on 7/21/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct RatingsListView: View {
    @State private var title = "Rating & Reviews"
    @State var isButtonShowing = false
    
    var body: some View {
        ScrollView {
            VStack {
                Divider()
                
                TitleAndButtonHStackView(title: $title, isButtonShowing: $isButtonShowing)
                RatingAndReviewsView()
            }
        }.navigationBarTitle("Rating & Reviews")
    }
}

#if DEBUG
struct RatingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsListView()
    }
}
#endif
