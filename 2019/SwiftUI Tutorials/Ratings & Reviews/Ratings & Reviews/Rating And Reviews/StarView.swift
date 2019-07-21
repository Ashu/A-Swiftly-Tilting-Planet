import SwiftUI

struct StarView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            Text("★★★★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★★★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★★")
                .font(.caption)
                .foregroundColor(Color.secondary)
            Text("★")
                .font(.caption)
            .foregroundColor(Color.secondary)
        }
    }
}

#if DEBUG
struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
    }
}
#endif
