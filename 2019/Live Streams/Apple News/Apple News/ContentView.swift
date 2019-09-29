import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            LogoView()
            WelcomeView()
            Spacer()
            SiriView()
            ButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
