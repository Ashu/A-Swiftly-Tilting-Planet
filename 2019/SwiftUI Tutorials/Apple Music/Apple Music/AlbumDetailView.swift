import SwiftUI

struct AlbumDetailView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                AlbumCoverView()
                    .frame(width: 150, height: 150)
                
                VStack(alignment: .leading) {
                    Text("Ablum Name")
                        .fontWeight(.heavy)
                    
                    Text("Various Artists")
                        .foregroundColor(.secondary)
                    
                    Text("Pop • 2019")
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    HStack {
                        Button(action: {
                            //
                        }) {
                            ZStack {
                                Capsule()
                                    .frame(width: 80, height: 34)
                                    .foregroundColor(.pink)
                                
                                HStack {
                                    Image(systemName: "plus")
                                    
                                    Text("ADD")
                                        .fontWeight(.heavy)
                                }.accentColor(.white)
                            }
                        }
                        
                        Spacer()
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "ellipsis.circle.fill")
                                .font(.title)
                                .accentColor(.pink)
                        }
                    }.padding(.bottom)
                }.padding(.top, 8)
            }
                .frame(height: 100, alignment: .center)
                .padding()
            
            Spacer()
        }
            .navigationBarTitle("", displayMode: .inline)
            .padding(.top)
    }
}

#if DEBUG
struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView()
    }
}
#endif
