import SwiftUI

struct TitleAndButtonHStackView: View {
    @Binding var title: String
    
    var body: some View {
        HStack {
            Text("\(title)")
                .font(.title)
                .fontWeight(.heavy)
                
            Spacer()
            
            Button(action: {
                //
                }) {
                    Text("See All")
                        .fontWeight(.heavy)
                }
        }
            .padding(.horizontal)
    }
}

#if DEBUG
//struct TitleAndButtonHStackView_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleAndButtonHStackView()
//    }
//}
#endif
