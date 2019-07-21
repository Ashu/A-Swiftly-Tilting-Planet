import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Get ready for an exhilarating virus hunt!\n💉 Use your puzzle skills to eliminate pesky viruses!")
                .lineLimit(20)
            
            Divider()
                .padding()
            
            RatingAndReviewsView()
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
