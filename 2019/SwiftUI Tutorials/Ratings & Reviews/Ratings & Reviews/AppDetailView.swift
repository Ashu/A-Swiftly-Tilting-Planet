import SwiftUI

struct AppDetailView: View {
    @State private var title = "Rating & Reviews"
    @State var isButtonShowing = true
    
    var body: some View {
        ScrollView {
            VStack {
                AppImageTitleAndButtonsView()
                
                Text("Get ready for an exhilarating virus hunt!\n💉 Use your puzzle skills to eliminate pesky viruses!")
                    .lineLimit(200)
                
                Divider()
                    .padding()
                
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
