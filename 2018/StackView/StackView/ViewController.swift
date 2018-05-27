//
//  ViewController.swift
//  StackView
//
//  Created by Caleb Wells on 5/26/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        for _ in 0 ..< 10 {
            let vw = UIButton(type: .system)
            vw.setTitle("Button", for: .normal)
            stackView.addArrangedSubview(vw)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let sc = traitCollection.horizontalSizeClass
        
        if sc == .compact {
            stackView.axis = .vertical
        } else {
            stackView.axis = .horizontal
        }
    }

}

