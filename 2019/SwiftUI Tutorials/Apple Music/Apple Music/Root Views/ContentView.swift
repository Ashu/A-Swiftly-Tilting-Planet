import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                NavigationView { LibraryView().navigationBarTitle("Library") }
                    .tabItem {
                        Image(systemName: "square.stack.fill")
                        Text("Library")
                }
                .tag(0)
                
                NavigationView { ForYouView() } 
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("For You")
                }
                .tag(1)
                
                NavigationView { Text("").navigationBarTitle("Browse") }
                    .tabItem {
                        Image(systemName: "music.note")
                        Text("Browse")
                }
                .tag(2)
                
                NavigationView { Text("").navigationBarTitle("Radio") }
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Radio")
                }
                .tag(3)
                
                NavigationView { Text("").navigationBarTitle("Search") }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                }
                .tag(4)
            }
            
            BottomMusicPlayerView()
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
