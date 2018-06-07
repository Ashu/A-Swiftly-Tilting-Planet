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
        rippleView.layer.cornerRadius = 100
        rippleView.clipsToBounds = false
        rippleView.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        rippleView.layer.borderWidth = 6.0
        return rippleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2117647059, alpha: 1)
        
        view.addSubview(rippleView)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        view.addGestureRecognizer(longPress)
        
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {

            let location = sender.location(in: sender.view)
            let viewLocation = CGRect(x: location.x, y: location.y, width: 200, height: 200)

            rippleView.frame = viewLocation


            animateRippleEffect()
            print("=== Hello ripple!!")
        }
    }
    
    func animateRippleEffect(){
        rippleView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.rippleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { finished in
//            self.animateRippleEffect()
        })
    }
}

