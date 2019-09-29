import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome to")
                .font(.system(size: 54))
                .fontWeight(.black)
                .padding(.bottom, -24)
            
            Text("Apple News")
                .font(.system(size: 54))
                .fontWeight(.black)
                .foregroundColor(.pink)
                .padding(.bottom, 4)
            
            Text("The best stories from the sources\nyou love, selected just for you.")
                .font(.system(size: 22))
                .lineLimit(2)
        }.padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
