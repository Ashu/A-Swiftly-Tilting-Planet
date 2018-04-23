//
//  ViewController.swift
//  Animations
//
//  Created by Caleb Wells on 4/19/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shoppingCart: UIImageView = {
        let cart = UIImageView(image: #imageLiteral(resourceName: "shopping"))
        cart.translatesAutoresizingMaskIntoConstraints = false
        return cart
    }()
    
    let badge: UILabel = {
        let badge = UILabel()
        badge.text = "1"
        badge.backgroundColor = .red
        badge.layer.masksToBounds = true
        badge.layer.cornerRadius = 50
        badge.translatesAutoresizingMaskIntoConstraints = false
        return badge
    }()
    
    let burrito: UILabel = {
        let label = UILabel()
        label.text = "🌯"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(shoppingCart)
        view.addSubview(badge)
        view.addSubview(burrito)
        
        badge.alpha = 0
        
        setUpLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        burrito.animate([
            .move(to: shoppingCart.center, duration: 1.2),
            .fadeOut(duration: 0.5)
        ])
        
        
        shoppingCart.animate([
            //???
        ])
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([
            shoppingCart.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            shoppingCart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            shoppingCart.widthAnchor.constraint(equalToConstant: 75),
            shoppingCart.heightAnchor.constraint(equalToConstant: 67.5),
            
            badge.topAnchor.constraint(equalTo: shoppingCart.bottomAnchor, constant: -30),
            badge.leadingAnchor.constraint(equalTo: shoppingCart.leadingAnchor, constant: -10),
            badge.widthAnchor.constraint(equalToConstant: 45),
            badge.heightAnchor.constraint(equalToConstant: 45),
            
            burrito.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            burrito.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

struct Animation {
    var duration: TimeInterval
    var closure: (UIView) -> Void
}

extension Animation {
    static func fadeIn(duration: TimeInterval) -> Animation {
        return Animation(duration: duration, closure: { $0.alpha = 1 })
    }
    
    static func fadeOut(duration: TimeInterval) -> Animation {
        return Animation(duration: duration, closure: { $0.alpha = 0 })
    }
    
    static func scale(to size: CGSize, duration: TimeInterval) -> Animation {
        return Animation(duration: duration, closure: { $0.frame.size = size })
    }
    
    static func move(to position: CGPoint, duration: TimeInterval) -> Animation {
        return Animation(duration: duration, closure: { $0.frame.origin = position })
    }
}

extension UIView {
    func animate(_ animations: [Animation]) {
        guard !animations.isEmpty else {    // Exit condition
            return
        }
        
        var animations = animations
        let animation = animations.removeFirst() // Take out the next animation
        
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self) // Perform the animation
        }, completion: { _ in
            self.animate(animations) // Recursively call the method
        })
    }
}

