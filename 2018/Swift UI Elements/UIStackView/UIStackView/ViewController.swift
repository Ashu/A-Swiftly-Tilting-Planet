import UIKit

class ViewController: UIViewController {
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view1.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view2.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        view3.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        view4.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        let stackView1 = UIStackView(arrangedSubviews: [view2, view3, view4])
        stackView1.axis = .vertical
        stackView1.spacing = 8
        stackView1.distribution = .fillEqually
        
        let stackView2 = UIStackView(arrangedSubviews: [view1, stackView1])
        stackView2.setCustomSpacing(24, after: view1)
        stackView2.distribution = .fillEqually
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView2.heightAnchor.constraint(equalToConstant: 150),
            stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView2.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40)
        ])
    }
    
}
