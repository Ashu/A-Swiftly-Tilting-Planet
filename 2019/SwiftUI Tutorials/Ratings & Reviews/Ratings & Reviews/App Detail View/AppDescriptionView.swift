import SwiftUI

struct AppDescriptionView: View {
    var body: some View {
        VStack {
            Text("Get ready for an exhilarating virus hunt!\n💉 Use your puzzle skills to eliminate pesky viruses!")
            .lineLimit(200)
        
        Divider()
            .padding()
        }
    }
}

#if DEBUG
struct AppDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AppDescriptionView()
    }
}
#endif
