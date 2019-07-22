import SwiftUI

struct AppScreenShotView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Image("ScreenShot")
                    .resizable()
                    .cornerRadius(27)
                    .frame(width: 280, height: 560)
                    .padding()
                
                Image("ScreenShot")
                    .resizable()
                    .cornerRadius(27)
                    .frame(width: 280, height: 560)
                    .padding()
                
                Image("ScreenShot")
                    .resizable()
                    .cornerRadius(27)
                    .frame(width: 280, height: 560)
                    .padding()
            }
        }
    }
}

#if DEBUG
struct AppScreenShotView_Previews: PreviewProvider {
    static var previews: some View {
        AppScreenShotView()
    }
}
#endif
