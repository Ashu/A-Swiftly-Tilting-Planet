import UIKit

class HeaderView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        createSubviews()
    }
    
    func createSubviews() {
        
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        let headerLabel = UILabel()
        headerLabel.text = "Hello, world"
        headerLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        headerLabel.adjustsFontForContentSizeCategory = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 200),
            header.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            headerLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            header.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
