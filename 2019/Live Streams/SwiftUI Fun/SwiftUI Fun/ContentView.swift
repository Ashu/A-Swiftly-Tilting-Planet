import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopView()
            XPBarView()
            DateSelectView()
            
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.bottom)
                
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(0 ..< 5) { item in
                        CardView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
