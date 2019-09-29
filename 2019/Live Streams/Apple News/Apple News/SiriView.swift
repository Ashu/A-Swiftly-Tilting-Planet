import SwiftUI

struct SiriView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "waveform.circle")
                .font(.system(size: 50))
                .padding(.top, 8)
            
            VStack(alignment: .leading) {
                Text("Siri suggests stories, channels, and\ntopics based on Safari and app.\nYou can change this in Settings.")
                    .lineLimit(3)
                
                Text("About Apple News & Privacy...")
                    .foregroundColor(.pink)
                    .padding(.vertical)
            }
        }.padding(.horizontal, 28)
    }
}

struct SiriView_Previews: PreviewProvider {
    static var previews: some View {
        SiriView()
    }
}
