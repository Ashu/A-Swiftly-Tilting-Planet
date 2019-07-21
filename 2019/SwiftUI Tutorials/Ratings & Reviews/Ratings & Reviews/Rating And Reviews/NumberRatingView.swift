import SwiftUI

struct NumberRatingView: View {
    var body: some View {
        VStack {
            Text("4.8")
                .font(Font.system(size: 55))
                .fontWeight(.heavy)
                .foregroundColor(Color.secondary)
                
            Text("out of 5")
                .font(Font.system(size: 18))
                .fontWeight(.heavy)
                .foregroundColor(Color.secondary)
        }
    }
}

#if DEBUG
struct NumberRatingView_Previews: PreviewProvider {
    static var previews: some View {
        NumberRatingView()
    }
}
#endif
