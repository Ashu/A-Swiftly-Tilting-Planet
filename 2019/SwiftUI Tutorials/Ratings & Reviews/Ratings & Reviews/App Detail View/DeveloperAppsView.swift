import SwiftUI

struct DeveloperAppsView: View {
    var body: some View {
        ScrollView {
            HStack{
                Text("Latest Release")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }.padding()
            
            AppCellView()
            Divider()
            
            HStack{
                Text("Apps")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    VStack {
                        AppCellView()
                        AppCellView()
                        AppCellView()
                    }.frame(width: 360, alignment: .leading)
                    
                    VStack {
                        AppCellView()
                        AppCellView()
                        AppCellView()
                    }
                    
                    VStack {
                        AppCellView()
                        AppCellView()
                        AppCellView()
                    }
                }
            }
        }.navigationBarTitle("Caleb Wells", displayMode: .large)
    }
}

#if DEBUG
struct DeveloperAppsView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperAppsView()
    }
}
#endif
