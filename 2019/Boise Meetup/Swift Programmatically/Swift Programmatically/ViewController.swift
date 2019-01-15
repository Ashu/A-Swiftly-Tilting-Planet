//
//  ViewController.swift
//  Swift Programmatically
//
//  Created by Caleb Wells on 1/14/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var world = "world"
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(label)
        
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        for buttonTitle in ["Button One", "Button Two", "Button Three"] {
            let button = ButtonOne()
            button.addTarget(self, action: #selector(handleButtonTap(sender:)), for: .touchUpInside)
            button.setTitle(buttonTitle, for: .normal)
            stackView.addArrangedSubview(button)
        }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func handleButtonTap(sender button: UIButton) {
        if button.titleLabel?.text == "Button One" {
            label.text = "Hello, \(world)"
        } else {
            label.text = "Hello, Swift"
        }
    }
}

