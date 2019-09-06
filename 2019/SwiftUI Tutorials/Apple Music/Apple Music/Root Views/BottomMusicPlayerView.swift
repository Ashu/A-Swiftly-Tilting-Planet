import SwiftUI

struct BottomMusicPlayerView: View {
    @State private var isPresented = false
    
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
                .padding(.bottom, -12)
            Divider()
                .padding(.bottom, 48)
        }.onTapGesture {
            self.isPresented = true
        }.sheet(isPresented: $isPresented) {
            NowPlayingView()
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
