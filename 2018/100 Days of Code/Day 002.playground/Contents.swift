import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let randomColors = [#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 0.9993709922, green: 0.1453172863, blue: 0, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)]
    let randomCornerRadius = [12,24,87,120,8,72,220]
    let randomCornerRadiusTwo = [6,12,40,90,8,72,300]
    
    let cardViewOne = UIView()
    let cardViewTwo = UIView()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        setupLayout()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 2
        
        cardViewOne.addGestureRecognizer(tap)
    }
    
    func setupLayout() {
        cardViewOne.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        cardViewOne.layer.cornerRadius = 24
        
        cardViewTwo.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cardViewTwo.layer.cornerRadius = 40
        
        let stackView = UIStackView(arrangedSubviews: [cardViewOne, cardViewTwo])
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func handleTap() {
        animations()
    }
    
    func animations() {
        let newRandomColor = randomColors.randomElement()
        let newCornerRadius = randomCornerRadius.randomElement()
        let newCornerRadiusTwo = randomCornerRadiusTwo.randomElement()
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
            if self.cardViewOne.layer.cornerRadius == 24 {
                self.cardViewOne.layer.cornerRadius = CGFloat(newCornerRadius!)
                self.cardViewOne.layer.masksToBounds = true
                self.cardViewOne.backgroundColor = newRandomColor
                
                self.cardViewTwo.layer.cornerRadius = CGFloat(newCornerRadiusTwo!)
                self.cardViewTwo.layer.masksToBounds = true
                self.cardViewTwo.backgroundColor = newRandomColor
            } else {
                self.cardViewOne.layer.cornerRadius = CGFloat(newCornerRadius!)
                self.cardViewOne.layer.masksToBounds = true
                self.cardViewOne.backgroundColor = newRandomColor
                
                self.cardViewTwo.layer.cornerRadius = CGFloat(newCornerRadiusTwo!)
                self.cardViewTwo.layer.masksToBounds = true
                self.cardViewTwo.backgroundColor = newRandomColor
            }
        }, completion: nil)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
