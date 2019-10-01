import SwiftUI

struct ListView: View {
    let names = ["Steve", "Tim", "Bob", "Tom"]
    
    var body: some View {
        List(names, id: \.self) { name in
            NavigationLink(destination: SomeView()) {
                Image(systemName: "person.circle.fill")
                Text(name)
            }
        }.navigationBarTitle("List")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
