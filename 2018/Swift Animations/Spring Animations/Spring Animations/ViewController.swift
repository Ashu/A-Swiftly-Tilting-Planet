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
        segmentedControl.addTarget(self, action: #selector(handleSegmentedControl(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = .white
        textField.borderStyle = UITextBorderStyle.roundedRect
        return textField
    }()
    
    let textFieldTwo: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.borderStyle = UITextBorderStyle.roundedRect
        return textField
    }()
    
    let textFieldThree: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.backgroundColor = .white
        textField.borderStyle = UITextBorderStyle.roundedRect
        return textField
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(handleButtonPress), for: .touchUpInside)
        return button
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Thanks for signing up!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        setUpStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.alpha = 0
        button.alpha = 0
        textFieldThree.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateInWithSpring()
        showButton()
    }
    
    // MARK: === Handle actions.
    @objc func handleSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            showTextField()
        } else {
            hideTextField()
        }
    }
    
    @objc func handleButtonPress() {
        print("=== tap?")
    }
    
    // MARK: === Animations and transitions.
    func animateInWithSpring() {
        UIView.animate(withDuration: 2.0, delay: 0.25, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
            self.label.alpha = 1
            self.label.frame.origin.y -= 50
        }, completion: nil)
        
    }
    
    func showButton() {
        UIView.transition(with: button, duration: 2.0, options: [.transitionCurlDown], animations: {
            self.button.alpha = 1
        }, completion: nil)
    }
    
    func showTextField() {
        UIView.transition(with: textFieldThree, duration: 0.5, options: [.transitionFlipFromTop], animations: {
            self.textFieldThree.isHidden = false
        }, completion: nil)
    }
    
    func hideTextField() {
        UIView.transition(with: textFieldThree, duration: 0.5, options: [.transitionFlipFromBottom], animations: {
            self.textFieldThree.isHidden = true
        }, completion: nil)
    }
    
    // MARK: === Set up the stack view.
    func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [label,segmentedControl,textField,textFieldTwo,textFieldThree,button,footerLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        
        stackView.setCustomSpacing(70, after: label)
        stackView.setCustomSpacing(210, after: button)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -72),
            stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -50)
        ])
    }

}

