import SwiftUI

struct TimeRemainigView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(.secondary)
                    .frame(width: 380, height: 4)
                
                Capsule()
                    .foregroundColor(.primary)
                    .frame(width: 72, height: 4)
                
                Circle()
                    .foregroundColor(.primary)
                    .frame(width: 8, height: 8)
                    .padding(.leading, 69)
            }.padding(.horizontal)
            
            HStack {
                Text("2:07")
                Spacer()
                Text("-0:27")
            }.padding(.horizontal)
        }
    }
}

struct TimeRemainigView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRemainigView()
    }
}
