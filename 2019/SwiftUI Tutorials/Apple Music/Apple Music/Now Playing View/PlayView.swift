import SwiftUI

struct PlayView: View {
    var body: some View {
        HStack {
            Image(systemName: "backward.fill")
                .font(.system(size: 27))
            Spacer()
            
            Image(systemName: "play.fill")
                .font(.system(size: 48))
            Spacer()
            
            Image(systemName: "forward.fill")
                .font(.system(size: 27))
        }.padding(46)
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
