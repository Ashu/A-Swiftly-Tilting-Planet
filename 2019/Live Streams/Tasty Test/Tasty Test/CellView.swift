import SwiftUI

struct CellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("bake")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 160, alignment: .leading)
                .cornerRadius(12)
                .clipped()
            
            Text("Hello Food!")
                .fontWeight(.bold)
        }.padding(.leading)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
