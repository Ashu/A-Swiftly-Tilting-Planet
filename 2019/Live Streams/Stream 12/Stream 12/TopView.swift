import SwiftUI

struct TopView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "gear")
            }
            .padding(.trailing)
            
            Image("dude")
                .resizable()
                .frame(width: 140, height: 140)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            Text("Bob Smith")
                .font(.title)
                .fontWeight(.bold)
            
            Text("127,000 XP")
                .foregroundColor(.secondary)
                .padding()
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
