import SwiftUI

struct ContentView: View {
    @State private var title = "Rating & Reviews"
    @State var isButtonShowing = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Get ready for an exhilarating virus hunt!\n💉 Use your puzzle skills to eliminate pesky viruses!")
                    .lineLimit(20)
                
                Divider()
                    .padding()
                
                TitleAndButtonHStackView(title: $title, isButtonShowing: $isButtonShowing)
                
                RatingAndReviewsView()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
