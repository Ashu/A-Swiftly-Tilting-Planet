import SwiftUI

struct AlbumCoverView: View {
    var body: some View {
        Image("squirrel")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(8)
//            .frame(minWidth: 80, idealWidth: 80, maxWidth: 320, minHeight: 320, idealHeight: nil, maxHeight: 320, alignment: .center)
            .padding(.trailing)
    }
}

#if DEBUG
struct AlbumCoverView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCoverView()
    }
}
#endif
