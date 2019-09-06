import SwiftUI

struct NowPlayingView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(.secondary)
                .frame(width: 44, height: 6)
                .padding(.top, 12)
            
            Image("squirrel")
                .resizable()
                .cornerRadius(12)
//                .scaledToFit()
                .frame(width: 280, height: 280, alignment: .center)
                .padding(44)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello World")
                        .fontWeight(.heavy)
                    
                    Text("Developer")
                }
                Spacer()
                
                Image(systemName: "ellipsis.circle.fill")
                    .font(.title)
            }.padding()
            
            TimeRemainigView()
            
            PlayView()
            
            VolumeView()
            
            OptionsView()
        }
    }
}
