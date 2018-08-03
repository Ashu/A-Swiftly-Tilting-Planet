import UIKit
import PlaygroundSupport

class MyViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 100, y: 40, width: 200, height: 200)
        // Set this to true.
        //Image views and labels set this to false by default.
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello Gestures!"
        label.textColor = .black
        label.frame = CGRect(x: 100, y: 260, width: 200, height: 20)
        // Set this to true.
        //Image views and labels set this to false by default.
        label.isUserInteractionEnabled = true
        return label
    }()

    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        self.view = view
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(handleImageTap(sender:)))
        imageView.addGestureRecognizer(imageTap)
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(handleLabelTap(sender:)))
        label.addGestureRecognizer(labelTap)
    }
    
    @objc func handleImageTap(sender: UITapGestureRecognizer) {
        imageView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    @objc func handleLabelTap(sender: UITapGestureRecognizer) {
        label.frame = CGRect(x: 180, y: 260, width: 200, height: 20)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
