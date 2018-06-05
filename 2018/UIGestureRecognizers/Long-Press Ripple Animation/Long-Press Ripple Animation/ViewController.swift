//
//  ViewController.swift
//  Long-Press Ripple Animation
//
//  Created by Caleb Wells on 6/5/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rippleView: UIView = {
        let rippleView = UIView()
        rippleView.backgroundColor = #colorLiteral(red: 0.7254901961, green: 0.1843137255, blue: 0.2980392157, alpha: 1)
        rippleView.translatesAutoresizingMaskIntoConstraints = false
        return rippleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2117647059, alpha: 1)
        
        view.addSubview(rippleView)
        
        NSLayoutConstraint.activate([
            rippleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            rippleView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            rippleView.heightAnchor.constraint(equalToConstant: 200),
            rippleView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        rippleView.addGestureRecognizer(longPress)
        
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            animateRippleEffect()
            print("=== Hello ripple!!")
        }
    }
    
    func animateRippleEffect(){
        rippleView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.rippleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { finished in
            self.animateRippleEffect()
        })
    }
}

