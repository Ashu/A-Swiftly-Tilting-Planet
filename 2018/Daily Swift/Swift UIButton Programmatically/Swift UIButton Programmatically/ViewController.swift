import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(button)
//        button.setTitle("Tap", for: .normal)
//        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        let stacView = UIStackView()
        stacView.spacing = 20
        stacView.distribution = .fillEqually
        stacView.axis = .vertical
        stacView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stacView)
        
        let buttonNames = ["One", "Two", "Three"]
        
        for name in buttonNames {
            let button = Button()
            button.setTitle(name, for: .normal)
            stacView.addArrangedSubview(button)
        }

        NSLayoutConstraint.activate([
            stacView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stacView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stacView.widthAnchor.constraint(equalToConstant: 200),
            stacView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    @objc func handleButton() {
        print("Tap!!")
    }
}
