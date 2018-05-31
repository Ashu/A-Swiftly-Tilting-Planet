//
//  ViewController.swift
//  Swift Q&A 01
//
//  Created by Caleb Wells on 5/30/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        textField.delegate = self
        textField.placeholder = "Enter numder of buttons"
        
        let button = UIButton(type: .system)
        button.setTitle("Next Screen", for: .normal)
        button.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [textField, button])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func nextScreen() {
        textField.resignFirstResponder()
        
        if textField.text == nil {
            print("No value.")
        } else {
            let number = Int(textField.text!) ?? 0
            let numberOfButtons = number * number
            
            print(numberOfButtons)
            
            if number > 0 {
                print("Great!")
                navigationController?.pushViewController(NewVC(), animated: true)
            }
        }
        
        textField.text = ""
    }
    
}

