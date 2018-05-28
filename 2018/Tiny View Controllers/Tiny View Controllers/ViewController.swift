//
//  ViewController.swift
//  Tiny View Controllers
//
//  Created by Caleb Wells on 5/27/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let header = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        add(header)
        
        layoutSubviews()
        
    }
    
    func layoutSubviews() {
//        let stackView = UIStackView(arrangedSubviews: [header])
//        stackView.axis = .vertical
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(stackView)
//        
//        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
}

