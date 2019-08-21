import SwiftUI

struct BottomMusicPlayerView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                AlbumCoverView()
                    .frame(width: 64, height: 64)
                    .padding(.leading)
                
                Text("Song name")
                
                Spacer()
                
                Image(systemName: "pause.fill")
                    .font(.title)
                    .padding(.trailing)
                Image(systemName: "forward.fill")
                    .font(.title)
                    .padding(.trailing)
            }
            .frame(height: 64, alignment: .center)
                .background(
                    BlurredEffectView()
                        .frame(height: 64)
            )
                .padding(.bottom, -8)
            Divider()
                .padding(.bottom, 48)
        }
    }
}

#if DEBUG
struct BottomMusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMusicPlayerView()
    }
}
#endif
