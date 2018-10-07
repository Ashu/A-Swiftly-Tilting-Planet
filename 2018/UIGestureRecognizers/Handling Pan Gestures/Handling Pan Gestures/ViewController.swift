import UIKit

class ViewController: UIViewController {
    
    let box: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var initialCenterPoint = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(box)
        setupLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        box.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ pan: UIPanGestureRecognizer) {
        if pan.state == .began {
            self.initialCenterPoint = box.center
        }
        
        let translation = pan.translation(in: view)
        
        if pan.state != .cancelled {
            let newCenter = CGPoint(x: initialCenterPoint.x + translation.x, y: initialCenterPoint.y + translation.y)
            box.center = newCenter
        } else {
            box.center = initialCenterPoint
        }
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            box.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            box.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            box.widthAnchor.constraint(equalToConstant: 200),
            box.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
