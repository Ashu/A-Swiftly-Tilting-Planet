import SwiftUI

struct LibraryView: View {
    let libraryList = ["Playlists", "Artists", "Albums", "Songs", "Downloaded Music"]
    var recentlyAddedAlbums = ["One", "One", "One", "One", "One", "One", "One", "One", "One", "One", "One", "lol"]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(libraryList, id: \.self) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: Text("Coming soon... maybe.")) {
                            HStack {
                                Text("\(item)")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .padding(.trailing)
                            }
                        }
                        
                        Divider()
                    }.padding(.leading)
                }
                
                HStack {
                    Text("Recently Added")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                }.padding(.bottom, -40)
                
                ForEach(recentlyAddedAlbums, id: \.self) { item in
                    VStack {
                        HStack {
                            AlbumGridCellView()
                            Spacer()
                            AlbumGridCellView()
                        }
                            .frame(width: 400, height: 250, alignment: .center)
                            .padding(.leading)
                    }
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            //
        }, label: {
            Text("Edit")
        }))
    }
}

#if DEBUG
struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
#endif
