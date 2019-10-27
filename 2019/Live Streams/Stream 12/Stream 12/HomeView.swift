import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)
                
                VStack {
                    TopView()
                    ButtonHstackView()
                    MainListView()
                    
                    Spacer()
                }
            }
        }
        .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
