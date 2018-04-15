//
//  ViewController.swift
//  How to dismiss the keyboard in Swift
//
//  Created by Caleb Wells on 4/14/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "How to dismiss the keyboard in Swift"
        text.font = UIFont.systemFont(ofSize: 16)
        text.borderStyle = UITextBorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.yes
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.default
        text.clearButtonMode = UITextFieldViewMode.whileEditing
        text.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        textField.delegate = self
        
        setUpLayout()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func setUpLayout() {
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

