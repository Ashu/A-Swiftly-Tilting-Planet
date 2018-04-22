//
//  ViewController.swift
//  Animations
//
//  Created by Caleb Wells on 4/19/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let labelOne: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        
        setUpLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        labelOne.alpha = 0
        labelTwo.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2.5) {
//            self.label.alpha = 1
//            self.label.frame.origin.y -= 100
//        }
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
            self.labelOne.alpha = 1
            self.labelOne.frame.origin.y = 80
            self.labelOne.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { completed in
            
        }
        
        UIView.animate(withDuration: 2.5, delay: 1, options: [.curveEaseOut], animations: {
            self.labelTwo.alpha = 1
            self.labelTwo.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        }) { completed in
            
        }
    }
    
    func setUpLayout() {
        labelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        labelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 50).isActive = true
    }
}

