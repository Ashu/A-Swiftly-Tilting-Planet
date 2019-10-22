import SwiftUI

struct TopView: View {
    var body: some View {
        HStack {
            Image("woman")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .clipShape(Circle())
                .shadow(color: .secondary, radius: 12, x: 0, y: 8)
            
            
            VStack(alignment: .leading) {
                Text("Hello Kelsey")
                    .fontWeight(.bold)
                
                Text("Things are looking good")
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .font(.headline)
                .rotationEffect(Angle(degrees: 90))
                .padding(.trailing)
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
