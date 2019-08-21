import SwiftUI

struct AlbumAndArtistsTextView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Album name")
            Text("Artists name")
                .foregroundColor(.secondary)
        }
    }
}

#if DEBUG
struct AlbumAndArtistsTextView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumAndArtistsTextView()
    }
}
#endif
