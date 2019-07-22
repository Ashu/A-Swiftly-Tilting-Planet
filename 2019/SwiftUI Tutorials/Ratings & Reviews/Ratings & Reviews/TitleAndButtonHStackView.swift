import SwiftUI

struct TitleAndButtonHStackView: View {
    @Binding var title: String
    @Binding var isButtonShowing: Bool
    
    var body: some View {
        HStack {
            Text("\(title)")
                .font(.title)
                .fontWeight(.heavy)
                
            Spacer()
            
            if isButtonShowing == true {
                NavigationLink(destination: RatingsListView()) {
                    Text("See All")
                        .fontWeight(.heavy)
                }
            }
        }
            .padding(.horizontal)
    }
}
