import SwiftUI

struct AlbumGridCellView: View {
    var body: some View {
        ZStack {
            AlbumCoverView()
                .cornerRadius(12)
                .frame(minWidth: 80, idealWidth: 80, maxWidth: 320, minHeight: 320, idealHeight: nil, maxHeight: 320, alignment: .center)
            NavigationLink(destination: AlbumDetailView()) {
                VStack(alignment: .leading) {
                    Rectangle()
                        .hidden()
                        .frame(minWidth: 80, idealWidth: 80, maxWidth: 320, minHeight: 320, idealHeight: nil, maxHeight: 320, alignment: .center)
                    
                    AlbumAndArtistsTextView()
                        .padding(.top, -60)
                }
            }
        }
    }
}

#if DEBUG
struct AlbumGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumGridCellView()
    }
}
#endif
