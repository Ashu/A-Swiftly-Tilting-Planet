import SwiftUI

struct AppImageTitleAndButtonsView: View {
    var body: some View {
        HStack {
            Image("AppIcon")
            
            VStack(alignment: .leading) {
                Text("App Name")
                
                Text("Get apps & Stuff")
                    .foregroundColor(Color.secondary)
                
                HStack {
                    Button(action: {
                        // Get this app!
                    }, label: {
                        ZStack {
                            Capsule()
                                .frame(width: 68, height: 34)
                                .foregroundColor(.blue)
                            
                            Text("GET")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                    })
                    
                    Text("In-App\nPurchases")
                        .font(.caption)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Button(action: {
                        // Get this app!
                    }, label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(Font.system(size: 27))
                    })
                }
            }
        }
            .padding()
    }
}

#if DEBUG
struct AppImageTitleAndButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        AppImageTitleAndButtonsView()
    }
}
#endif
