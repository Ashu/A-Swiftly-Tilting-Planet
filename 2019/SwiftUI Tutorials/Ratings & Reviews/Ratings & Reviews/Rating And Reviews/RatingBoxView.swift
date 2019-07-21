import SwiftUI

struct RatingBoxView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(8)
                .foregroundColor(.secondary)
            
            VStack {
                HStack {
                    Text("Awesome graphics! 🤯")
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text("Oct 31")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("★★★☆☆")
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    Text("App_Addict87")
                        .foregroundColor(.secondary)
                }
                
                Text("""
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    """)
                    .lineLimit(8)
            }
            .padding()
        }
            .padding()
    }
}

#if DEBUG
struct RatingBoxView_Previews: PreviewProvider {
    static var previews: some View {
        RatingBoxView()
    }
}
#endif
