import SwiftUI
import UIKit

struct BlurredEffectView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let blurredView = BlurredView()
        let blurView = blurredView.view!
        blurView.frame = .zero
        return blurView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurredEffectView>) {
        // No need to update this view.
    }
}

class BlurredView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 64)
        view.addSubview(blurredEffectView)
    }
}
