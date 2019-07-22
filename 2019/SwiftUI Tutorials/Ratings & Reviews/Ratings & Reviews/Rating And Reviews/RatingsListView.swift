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
    @State var isPresented: Bool = false
        
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Sort by"), message: nil,
                    buttons: [
                        .default(Text("Most Helpful"), onTrigger: {
                            // Sort!
                        }),
                        .default(Text("Most Favorable"), onTrigger: {
                            // Sort!
                        }),
                        .default(Text("Most Critical"), onTrigger: {
                            // Sort!
                        }),
                        .default(Text("Most Recent"), onTrigger: {
                            // Sort!
                        }),
                        .cancel()
                    ])
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Divider()
                
                TitleAndButtonHStackView(title: $title, isButtonShowing: $isButtonShowing)
                RatingAndReviewsView()
                
                Button(action: {
                    self.isPresented = true
                }, label: {
                    HStack {
                        Spacer()
                        Text("Sort by Most Helpful")
                        Image(systemName: "chevron.compact.down")
                    }.padding(.trailing)
                })
                    .actionSheet(isPresented: $isPresented, content: {
                        self.actionSheet
                })
                
                RatingBoxView()
                RatingBoxView()
                RatingBoxView()
            }
        }.navigationBarTitle("", displayMode: .inline)
    }
}

#if DEBUG
struct RatingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsListView()
    }
}
#endif
