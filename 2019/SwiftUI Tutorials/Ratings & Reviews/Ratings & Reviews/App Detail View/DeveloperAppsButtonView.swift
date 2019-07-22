import SwiftUI

struct DeveloperAppsButtonView: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: DeveloperAppsView()) {
                    VStack(alignment: .leading) {
                        Text("Caleb Wells")
                        Text("Developer")
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                Image(systemName: "chevron.right")
            }
                .padding()
            
            Divider()
        }
    }
}

#if DEBUG
struct DeveloperAppsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperAppsButtonView()
    }
}
#endif
