import SwiftUI

struct MainListView: View {
    let listStuff = ["A", "B", "C", "D", "E"]
    
    var body: some View {
        GeometryReader { geometry in
            List(self.listStuff, id: \.self) { item in
                HStack {
                    Image("dude")
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(item)
                            .font(.largeTitle)
                        
                        Text("Some detail text.")
                    }
                }
                .padding(.top)
            }
            .background(Color.white)
            .frame(width: geometry.size.width / 1.1, height: geometry.size.height)
            .cornerRadius(18)
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
