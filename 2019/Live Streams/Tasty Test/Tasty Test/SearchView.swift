import SwiftUI

struct SearchView: View {
    @State private var search = String()
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 44)
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding()
                
                Spacer()
                TextField("Search Tasty", text: $search)
                Spacer()
            }
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
