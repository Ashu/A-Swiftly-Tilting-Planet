import SwiftUI

struct DateSelectView: View {
    let dateTitles = ["Today", "Monthly", "Yearly", "Future"]
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(self.dateTitles, id: \.self) { title in
                VStack {
                    Text(title)
                        .bold()
                        .padding(.horizontal)
                    
                    if title.contains("Today") {
                        Rectangle()
                            .frame(width: 64, height: 4)
                            .foregroundColor(.red)
                    } else {
                        EmptyView()
                    }
                }.padding(.bottom, -13)
            }
        }.padding(.top)
    }
}

struct DateSelectView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectView()
    }
}
