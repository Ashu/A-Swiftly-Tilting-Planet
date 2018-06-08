//
//  ViewController.swift
//  Input Accessory View Programmatically
//
//  Created by Caleb Wells on 6/8/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        let inputAccessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        inputAccessoryView.backgroundColor = #colorLiteral(red: 0.6784313725, green: 0.7019607843, blue: 0.7490196078, alpha: 1)
        textField.inputAccessoryView = inputAccessoryView
        
        
        button.frame = CGRect(x: 250, y: 0, width: 88.0, height: 44.0)
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(completeCurrentWord), for: .touchUpInside)
        inputAccessoryView.addSubview(button)
        
    }
    
    @objc func completeCurrentWord() {
        print("Hello, input accessory view!")
    }
    
    func setUpView() {
        view.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2117647059, alpha: 1)
        
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -80)
        ])
    }
}

