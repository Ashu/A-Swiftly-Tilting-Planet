import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let headerView: UIView = {
        let header = UIView()
        header.backgroundColor = #colorLiteral(red: 1, green: 0.5061584115, blue: 0.1756399274, alpha: 1)
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "UISwitch"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uiSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.onTintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1.0)
        uiSwitch.addTarget(self, action: #selector(handleValueChange), for: .valueChanged)
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        return uiSwitch
    }()
    
    @objc func handleValueChange(sender: UISwitch) {
        if uiSwitch.isOn {
            view.backgroundColor = UIColor(red: 26/255, green: 40/255, blue: 54/255, alpha: 1.0)
        } else {
            view.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        view.addSubview(uiSwitch)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        setUpHeader()
        
        uiSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        uiSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
    func setUpHeader() {
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerView.addSubview(headerTitle)
        headerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        headerTitle.centerYAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
}