import SwiftUI

struct AppDetailView: View {
    @State private var title = "Rating & Reviews"
    @State var isButtonShowing = true
    
    var body: some View {
        ScrollView {
            VStack {
                AppImageTitleAndButtonsView()
                
                AppRatingChartsAndAgeView()
                
                AppScreenShotView()
                
                AppDescriptionView()
                
                TitleAndButtonHStackView(title: $title, isButtonShowing: $isButtonShowing)
                
                RatingAndReviewsView()
                
                RatingsScrollView()
            }.navigationBarTitle("", displayMode: .inline)
        }
    }
}

#if DEBUG
struct AppDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppDetailView()
    }
}
#endif
