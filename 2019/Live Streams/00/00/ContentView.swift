import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView { ListView() }
            .tabItem {
                Image(systemName: "list.dash")
                Text("List")
            }.tag(0)
            
            NavigationView { NotListView() }
            .tabItem {
                Image(systemName: "flame.fill")
                Text("Not List")
            }.tag(1)
        }
    }
}

// next
struct ListView: View {
    let names = ["Bob", "Smith", "Todd", "Tim", "Steve"]
    
    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                NavigationLink(destination: Text("Hi \(name)")) {
                    Image(systemName: "person.crop.circle.fill")
                    Text(name)
                }
            }
        }.navigationBarTitle("Hello List")
    }
}

// next
struct NotListView: View {
    var body: some View {
        VStack {
            Text("Hi!")
        }.navigationBarTitle("Hello Not List")
    }
}
