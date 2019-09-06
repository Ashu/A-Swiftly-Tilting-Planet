import SwiftUI

struct OptionsView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "quote.bubble")
            Spacer()
            
            VStack {
                Image(systemName: "airplayaudio")
                Text("AirPods")
            }
            
            Spacer()
            Image(systemName: "list.bullet")
            Spacer()
        }.padding([.top, .horizontal])
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
