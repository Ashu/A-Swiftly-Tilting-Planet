import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView { LibraryView().navigationBarTitle("Library") }
            .tabItem {
                Image(systemName: "music.note.list")
                Text("Library")
            }
            
            NavigationView { Text("Coming soon") }.foregroundColor(.pink)
            .tabItem {
                Image(systemName: "heart.fill")
                Text("For You")
            }
            
            NavigationView { Text("Coming soon") }.foregroundColor(.pink)
            .tabItem {
                Image(systemName: "music.note")
                Text("Browse")
            }
            
            NavigationView { Text("Coming soon") }.foregroundColor(.pink)
            .tabItem {
                Image(systemName: "dot.radiowaves.left.and.right")
                Text("Radio")
            }
            
            NavigationView { Text("Coming soon") }.foregroundColor(.pink)
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.dark)
    }
}
