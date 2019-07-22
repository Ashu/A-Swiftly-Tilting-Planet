import SwiftUI

struct AppDetailView: View {
    @State private var title = "Rating & Reviews"
    @State private var isButtonShowing = true
    
    var body: some View {
        ScrollView {
            VStack {
                AppImageTitleAndButtonsView()
                
                AppRatingChartsAndAgeView()
                
                AppScreenShotView()
                
                MoreAppScreenShotsView()
                
                AppDescriptionView()
                
                DeveloperAppsButtonView()
                
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
