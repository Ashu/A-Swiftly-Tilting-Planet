import SwiftUI

struct FeedView: View {
    var body: some View {
        List {
            ZStack {
                Image("jogging")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 600, alignment: .leading)
                    .padding(.leading, -16)
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 600, alignment: .leading)
                    .padding(.leading, -16)
                    .foregroundColor(.black)
                    .opacity(0.2)
                
                VStack {
                    Text("MEMBER ACCESS")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    
                    Text("REACT")
                        .font(.system(size: 72))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.bottom, -38)
                    
                    Text("BY YOU")
                        .font(.system(size: 72))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.bottom, -18)
                        
                    
                    Text("ONE CREW")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding(.bottom, 100)
                                        
                    HStack {
                        Button(action: {
                            print("Button!")
                        }) {
                            Text("LEARN MORE")
                                .foregroundColor(.white)
                                .padding()
                                .border(Color.white, width: 1)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationBarTitle("FEED", displayMode: .inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeedView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            
            FeedView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}
