//
//  ViewController.swift
//  FoodTracker
//
//  Created by Caleb Wells on 4/16/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Meal Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter meal name"
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let setDefaultTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set default text", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handlSetDefaultTextButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(setDefaultTextButton)
        
        setUpLayouts()
    }
    
    func setUpLayouts() {
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        
        setDefaultTextButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 12).isActive = true
        setDefaultTextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        setDefaultTextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        setDefaultTextButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    @objc func handlSetDefaultTextButton(_ sender: UIButton) {
        label.text = "Default Text"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        label.text = textField.text
        textField.text = ""
    }
}

