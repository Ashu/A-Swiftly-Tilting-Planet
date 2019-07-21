import SwiftUI

struct RatingLineView: View {
    var ratings = [12, 27, 72, 87, 100, 112, 120, 127, 133]
        
    var body: some View {
        ZStack(alignment: .trailing) {
            BottomLineView()
            
            Capsule()
                .frame(width: CGFloat(ratings.randomElement()!), height: 4)
        }
    }
}

#if DEBUG
struct RatingLineView_Previews: PreviewProvider {
    static var previews: some View {
        RatingLineView()
    }
}
#endif
