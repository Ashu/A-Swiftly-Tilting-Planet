import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopView()
            
            ScrollView(.vertical, showsIndicators: true) {
                TopImageView()
                
                CellView()
                CellView()
                CellView()
                CellView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Make new .swift file!
struct TopView: View {
    @State private var search = String()
    
    var body: some View {
        HStack {
            Text("Games")
                .font(.title)
                .fontWeight(.black)
                .padding(.trailing, 28)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                    .padding(.leading, 6)
                
                TextField("Search", text: $search)
            }
            .padding(6)
            .background(Color.secondary.opacity(0.3))
            .cornerRadius(12)
        }.padding()
    }
}

// Make new .swift file!
struct TopImageView: View {
    var body: some View {
        VStack {
            Image("future")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 380, height: 200, alignment: .center)
                .cornerRadius(18)
            
            HStack {
                Text("Trendy Games")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }.padding()
        }
    }
}

// Make new .swift file!
struct CellView: View {
    var body: some View {
        HStack {
            Image("technology")
                .resizable()
                .frame(width: 100, height: 150, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(18)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Robot Fights")
                            .fontWeight(.heavy)
                        
                        Text("Shooter")
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                HStack {
                    Text("Fun")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(12)
                    
                    Text("New")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                            .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(12)
                    
                    Text("Online")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 28))
                    
                    Text("280")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                }
            }
        }.padding()
    }
}
