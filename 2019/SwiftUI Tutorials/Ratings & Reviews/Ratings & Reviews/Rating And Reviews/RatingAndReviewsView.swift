import SwiftUI

struct RatingAndReviewsView: View {
    var body: some View {
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

#if DEBUG
struct RatingAndReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingAndReviewsView()
    }
}
#endif
