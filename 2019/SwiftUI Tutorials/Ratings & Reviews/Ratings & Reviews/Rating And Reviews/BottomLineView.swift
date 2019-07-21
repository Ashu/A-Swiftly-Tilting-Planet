import SwiftUI

struct BottomLineView: View {
    var body: some View {
        Capsule()
            .frame(width: 200, height: 4)
            .foregroundColor(.secondary)
    }
}

#if DEBUG
struct BottomLineView_Previews: PreviewProvider {
    static var previews: some View {
        BottomLineView()
    }
}
#endif
