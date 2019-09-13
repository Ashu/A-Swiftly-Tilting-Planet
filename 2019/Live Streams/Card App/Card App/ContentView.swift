import SwiftUI

struct ContentView: View {
    var body: some View {
        return ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TitleAndImageView()
                Spacer()
                
                CardsStackView()
                Spacer()
                
                PercentView()
                Spacer()
                
                BottomButtonsView()
            }.padding(.top, 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Make new .swift file!
struct TitleAndImageView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Design")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Everything new.")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Image(systemName: "faceid")
                .font(.system(size: 72))
                .foregroundColor(Color.white)
        }
        .padding([.horizontal, .bottom])
    }
}

// Make new .swift file!
struct CardView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("house")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 180)
                .clipped()
                .cornerRadius(12)
            
            VStack {
                Text("Look a house")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                
                Text("It would sure be nice to have a house\nlike that, right?")
                    .font(.body)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }.padding()
            
            Button(action: {
                print("Tap tap tap...")
            }) {
                Text("Learn More?")
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color(red: 1.0, green: 0.6, blue: 0, opacity: 0.6))
                    .cornerRadius(12)
            }.padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(28)
    }
}

// Make new .swift file!
struct BottomButtonsView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Home button")
            }) {
                Image(systemName: "house")
                    .font(.system(size: 24))
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button(action: {
                print("Bubble button")
            }) {
                Image(systemName: "bubble.left.and.bubble.right")
                    .font(.system(size: 24))
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button(action: {
                print("Rectangle button")
            }) {
                Image(systemName: "rectangle.on.rectangle.angled")
                    .font(.system(size: 24))
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button(action: {
                print("Search button")
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24))
                    .foregroundColor(Color.white)
            }
        }.padding(.horizontal, 44)
    }
}

struct CardsStackView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(28)
                .opacity(0.4)
                .offset(x: 0, y: 108)
                .frame(width: 290, height: 280)
            
            CardView()
        }
    }
}

struct PercentView: View {
    var body: some View {
        HStack {
            ZStack {
                Capsule()
                    .foregroundColor(Color.white)
                    .opacity(0.8)
                    .frame(width: 120, height: 4, alignment: .leading)
                    .cornerRadius(120)
                
                Capsule()
                    .foregroundColor(Color.white)
                    .frame(width: 60, height: 8, alignment: .leading)
                    .cornerRadius(12)
                    .padding(.trailing, 60)
            }
            
            Text("01 / 05")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Spacer()
        }.padding(.horizontal, 28)
    }
}
