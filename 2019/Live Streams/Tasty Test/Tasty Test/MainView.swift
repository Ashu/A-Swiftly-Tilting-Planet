import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            SearchView()
            
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Discover")
                        
                }.tag(1)
                
                Text("Tab Content 2")
                    .tabItem {
                        Image(systemName: "heart")
                        Text("My Recipes")
                }.tag(1)
                
                Text("Tab Content 3")
                    .tabItem {
                        Image(systemName: "rectangle.3.offgrid")
                        Text("One Top")
                }.tag(1)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
