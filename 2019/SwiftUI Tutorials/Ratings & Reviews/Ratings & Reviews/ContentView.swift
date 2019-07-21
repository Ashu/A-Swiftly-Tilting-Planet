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

// Make a new .swift file!
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

// Make a new .swift file!
struct StarView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            Text("★★★★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★★★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★")
                .font(.caption)
            .foregroundColor(Color.secondary)
        }
    }
}

// Make a new .swift file!
struct BottomLineView: View {
    var body: some View {
        Capsule()
            .frame(width: 200, height: 4)
            .foregroundColor(.secondary)
    }
}

// Make a new .swift file!
struct RatingLineView: View {
    var ratings = [8, 12, 27, 42, 72, 87, 94, 100, 112, 120, 127, 133]
    
    var body: some View {
        ZStack(alignment: .trailing) {
            BottomLineView()
            
            Capsule()
                .frame(width: CGFloat(ratings.randomElement()!), height: 4)
        }
    }
}
