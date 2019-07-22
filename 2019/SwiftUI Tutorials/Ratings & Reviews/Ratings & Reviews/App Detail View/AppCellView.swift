import SwiftUI

struct AppCellView: View {
    var body: some View {
        HStack {
            Image("AppIcon")
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text("App name")
                Text("Photo & Video")
            }
            
            Spacer()
            
            VStack {
                Button(action: {
                    // Get this app!
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(width: 80, height: 34)
                            .foregroundColor(Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1.0))
                        
                        Text("$4.99")
                            .fontWeight(.heavy)
                            .foregroundColor(.blue)
                    }
                })
                
                Text("In-App Purchases")
                    .font(.caption)
            }
        }
            .padding()
    }
}

#if DEBUG
struct AppCellView_Previews: PreviewProvider {
    static var previews: some View {
        AppCellView()
    }
}
#endif
