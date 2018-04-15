//
//  ViewController.swift
//  Simple to-do list app
//
//  Created by Caleb Wells on 4/13/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Extremely simple to-do list app"
        label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "add to-dos"
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
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let lable: UILabel = {
        let label = UILabel()
        label.text = "My To-Do list"
        label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textView: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 16)
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextField.delegate = self
        
        view.addSubview(titleLable)
        view.addSubview(addTextField)
        view.addSubview(addButton)
        view.addSubview(lable)
        view.addSubview(textView)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        addTextField.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 24).isActive = true
        addTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        addTextField.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -24).isActive = true
        
        addButton.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 24).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lable.topAnchor.constraint(equalTo: addTextField.bottomAnchor, constant: 24).isActive = true
        lable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        
        textView.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 24).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        
    }
    
    @objc func handleButtonTap() {
        if let text = addTextField.text {
            if text == "" {
                return
            }
            
            textView.text.append("●  \(text)\n\n")
            addTextField.text = ""
            addTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTextField.resignFirstResponder()
        return true
    }
}

