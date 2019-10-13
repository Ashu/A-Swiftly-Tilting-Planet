import SwiftUI

struct ContentView: View {
    var numbers = [1,2,3,4,5,6,7]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.numbers, id: \.self) { item in
                            Circle()
                                .frame(width: 80)
                                .padding()
                        }
                    }
                }.frame(height: 100)
                
                List(0 ..< 5) { item in
                    Text("Hello, world")
                }
                HView()
    //            GeometryView()
            }.navigationBarTitle("Playing with SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(.init(rawValue: "iPhone XS Max"))

            ContentView()
                .previewDevice(.init(rawValue: "iPhone SE"))
        }
    }
}


struct GeometryView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ZStack {
                    Capsule()
                        .frame(width: geometry.size.width / 2, height: 50)
                        .foregroundColor(.secondary)
                    
                    Text("Hello, world!")
                }
                
                ZStack {
                    Capsule()
                        .frame(width: geometry.size.width / 2, height: 50)
                        .foregroundColor(.secondary)
                    
                    Text("Hello, Two!")
                }
            }
        }.padding()
    }
}

struct HView: View {
    var body: some View {
        HStack {
            ZStack {
                Capsule()
                    .foregroundColor(.blue)
                
                Text("Hello HStack")
            }
            
            ZStack {
                Capsule()
                    .foregroundColor(.blue)
                
                Text("Hello HStack")
            }
        }
        .frame(height: 50)
        .padding()
    }
}
