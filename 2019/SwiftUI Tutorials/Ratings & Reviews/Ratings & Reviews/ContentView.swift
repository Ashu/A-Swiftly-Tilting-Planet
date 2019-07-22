import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 5) { _ in
                NavigationLink(destination: AppDetailView()) {
                    Text("App!")
                }
            }.navigationBarTitle("Apps")
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
