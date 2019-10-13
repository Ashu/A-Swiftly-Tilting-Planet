import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView { FeedView() }
            .tabItem {
                Image(systemName: "house.fill")
            }.tag(0)
            
            NavigationView { SomeView() }
            .tabItem {
                Image(systemName: "hare.fill")
            }.tag(1)
            
            NavigationView { Text("View 3 coming soon?") }
            .tabItem {
                Image(systemName: "bag.fill")
            }.tag(2)
            
            NavigationView { Text("View 4 coming soon?") }
            .tabItem {
                Image(systemName: "tray.full.fill")
            }.tag(3)
            
            NavigationView { Text("View 5 coming soon?") }
            .tabItem {
                Image(systemName: "person.fill")
            }.tag(4)
        }.edgesIgnoringSafeArea([.top, .horizontal])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
