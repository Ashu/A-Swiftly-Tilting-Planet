import SwiftUI

struct XPBarView: View {
    var body: some View {
        VStack {
            ZStack {
                Capsule()
                    .foregroundColor(.secondary)
                    .frame(height: 16)
                
                GeometryReader { geometry in
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: geometry.size.width / 1.6, height: 16)
                        .padding(.trailing, geometry.size.width / 2.7)
                }.frame(height: 16)
            }.padding([.top, .horizontal])
            
            HStack {
                Text("Beginner Level")
                    .foregroundColor(.secondary)
                Spacer()
                Text("XP 380/500")
            }.padding([.horizontal, .bottom])
        }
    }
}
struct XPBarView_Previews: PreviewProvider {
    static var previews: some View {
        XPBarView()
    }
}
