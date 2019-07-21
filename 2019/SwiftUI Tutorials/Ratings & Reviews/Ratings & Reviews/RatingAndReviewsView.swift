import SwiftUI

struct RatingAndReviewsView: View {
    let ratingLineCount = [1,2,3,4,5]
    
    var body: some View {
        VStack {
            HStack {
                Text("Rating & Reviews")
                    .font(.title)
                    .fontWeight(.heavy)
                    
                Spacer()
                
                Button(action: {
                    //
                    }) {
                        Text("See All")
                            .fontWeight(.heavy)
                    }
            }
            .padding(.horizontal)
            
            HStack(alignment: .top) {
                NumberRatingView()
                    .padding(.trailing)
                
                StarView()
                
                VStack(alignment: .trailing) {
                    RatingLineView()
                        .padding(.bottom, 4)
                    RatingLineView()
                        .padding(.bottom, 4)
                    RatingLineView()
                        .padding(.bottom, 4)
                    RatingLineView()
                        .padding(.bottom, 4)
                    RatingLineView()
                        .padding(.bottom, 4)
                    
                    Text("270,000 Ratings")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.secondary)
                }
                    .padding(.top, 4)
            }
                .padding(.horizontal)
        }
    }
}

#if DEBUG
struct RatingAndReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingAndReviewsView()
    }
}
#endif
