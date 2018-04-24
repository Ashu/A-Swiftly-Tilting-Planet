//
//  ViewController.swift
//  Spring Animations
//
//  Created by Caleb Wells on 4/24/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, world"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Sign In", "Register"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .white
        return segmentedControl
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextBorderStyle.roundedRect
        return textField
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        return button
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Thanks for signing up!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 27)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        let stackView = UIStackView(arrangedSubviews: [label,segmentedControl,textField,button,footerLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.setCustomSpacing(100, after: label)
        stackView.setCustomSpacing(180, after: button)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -72),
            stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -50)
        ])
    }
    
}

