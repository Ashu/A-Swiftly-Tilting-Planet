import SwiftUI

struct LibraryView: View {
    let names = ["Playlist", "Artists", "Albums", "Songs", "Downloaded Muisc"]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(self.names, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        VStack {
                            HStack {
                                Text(name)
                                    .foregroundColor(.pink)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }.padding(.horizontal)
                            Divider()
                        }
                    }
                }
                
                HStack {
                    Text("Recently Added")
                        .fontWeight(.heavy)
                    Spacer()
                }.padding()
                
                GeometryReader { geometry in
                    HStack {
                        Image("guitar")
                            .resizable()
                            .frame(width: geometry.size.width / 2, height: 200, alignment: .center)
                            .cornerRadius(12)
                            .padding()
                            
                        Image("guitar")
                            .resizable()
                            .frame(width: geometry.size.width / 2, height: 200, alignment: .center)
                            .cornerRadius(12)
                            .padding()
                    }
                }.padding(.top, 80)
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .colorScheme(.dark)
    }
}
