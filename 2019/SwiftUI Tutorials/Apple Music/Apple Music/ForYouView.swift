import SwiftUI

struct ForYouView: View {
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    Text("SUNDAY, JULY 28")
                        .fontWeight(.heavy)
                        .foregroundColor(.secondary)
                        .padding(.leading, 24)
                    
                    Text("For You")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, -8)
                }
                
                Spacer()
                
                Button(action: {
                    //
                }) {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                }
            }.padding(.horizontal)
            Divider()
                .padding(.leading)
            
            Spacer()
        }
    }
}

#if DEBUG
struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouView()
    }
    
}
#endif
