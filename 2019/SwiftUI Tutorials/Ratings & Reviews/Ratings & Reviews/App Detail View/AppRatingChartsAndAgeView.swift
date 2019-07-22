import SwiftUI

struct AppRatingChartsAndAgeView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("4.8 ★★★★☆")
                    .fontWeight(.heavy)
                    .foregroundColor(.secondary)
                
                Text("69K Ratings")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            VStack {
                Text("#1")
                    .fontWeight(.heavy)
                    .foregroundColor(.secondary)
                
                Text("Games")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            VStack {
                Text("4+")
                    .fontWeight(.heavy)
                    .foregroundColor(.secondary)
                
                Text("Age")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
            .padding()
    }
}

#if DEBUG
struct AppRatingChartsAndAgeView_Previews: PreviewProvider {
    static var previews: some View {
        AppRatingChartsAndAgeView()
    }
}
#endif
