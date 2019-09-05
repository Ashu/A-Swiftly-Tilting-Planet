import UIKit

class InfoViewController: UIViewController {
    
    var infoText = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(infoText)
        infoText.isEditable = false
        infoText.font = .systemFont(ofSize: 18)
        infoText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoText.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            infoText.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -60),
            infoText.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -60)
            ])
    }
}
