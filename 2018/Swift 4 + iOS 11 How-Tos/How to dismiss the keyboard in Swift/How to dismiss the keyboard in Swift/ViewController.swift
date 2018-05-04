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
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextFieldViewMode.whileEditing
        text.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    let label = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        textField.delegate = self
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, label"
        
        setUpLayout()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // The textFieldDidEndEditing(_:) method gives you a chance to read the information entered into the text field and do something with it.
    func textFieldDidEndEditing(_ textField: UITextField) {
        label.text = textField.text
    }
    
    
    func setUpLayout() {
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        label.topAnchor.constraint(equalTo: textField.topAnchor, constant: -40).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

