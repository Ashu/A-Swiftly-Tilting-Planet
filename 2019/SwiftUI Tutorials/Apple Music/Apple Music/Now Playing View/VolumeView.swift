import SwiftUI

struct VolumeView: View {
    @State var sliderValue = 50.0
    var minValue = 0.0
    var maxValue = 100.0
    
    var body: some View {
        HStack {
            Image(systemName: "speaker.fill")
            
            Slider(value: $sliderValue, in: minValue...maxValue)
            
            Image(systemName: "speaker.3.fill")
        }.padding()
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
