import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HeaderView()
            
            HStack {
                Text("Trending")
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                Spacer()
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CellView()
                    CellView()
                    CellView()
                    CellView()
                }
            }
            
            HStack {
                Text("Make it Swift")
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                Spacer()
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CellView()
                    CellView()
                    CellView()
                    CellView()
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
