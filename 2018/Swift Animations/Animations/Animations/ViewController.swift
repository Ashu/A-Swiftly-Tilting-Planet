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
        view.addSubview(burrito)
        
        setUpLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        burrito.animate([
            .fadeOut(duration: 1.0)
        ])
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([
            shoppingCart.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            shoppingCart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            shoppingCart.widthAnchor.constraint(equalToConstant: 75),
            shoppingCart.heightAnchor.constraint(equalToConstant: 67.5),
            
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
}

extension UIView {
    func animate(_ animations: [Animation]) {
        guard !animations.isEmpty else {
            return
        }
        
        var animations = animations
        let animation = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            self.animate(animations)
        })
    }
}

