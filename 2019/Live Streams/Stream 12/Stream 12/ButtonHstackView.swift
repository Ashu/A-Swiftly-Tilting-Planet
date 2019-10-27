import SwiftUI

struct ButtonHstackView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button("BADGES") {
                    print("Badges tapped!")
                }
                .foregroundColor(.black)
                .frame(width: geometry.size.width / 3.8, height: 60)
                
                Button("FRIENDS") {
                    print("FRIENDS tapped!")
                }
                .foregroundColor(.black)
                .frame(width: geometry.size.width / 3.8, height: 60)
                
                Button("SCORES") {
                    print("SCORES tapped!")
                }
                .foregroundColor(.black)
                .frame(width: geometry.size.width / 3.8, height: 60)
            }
            .frame(width: geometry.size.width / 1.1, height: 60)
            .background(Color.white)
            .cornerRadius(18)
        }.frame(height: 72)
    }
}

struct ButtonHstackView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonHstackView()
    }
}
