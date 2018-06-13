//
//  ViewController.swift
//  Siri Shortcuts NSUserActivity
//
//  Created by Caleb Wells on 6/12/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hey Siri"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 27)
        return label
    }()
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Siri Button", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        return button
    }()
    
    @objc func handleButtonTap() {
        let activity = NSUserActivity(activityType: "com.Siri-Shortcuts-NSUserActivity.changeText")
        activity.title = "Siri shortcuts!"
        activity.userInfo = nil
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier("com.Siri-Shortcuts-NSUserActivity.changeText")
        view.userActivity = activity
        activity.becomeCurrent()
        
        changeText()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUpLayout()
    }
    
    func changeText() {
        label.text = "Siri Shortcuts!!"
    }
    
    func setUpLayout() {
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -200)
        ])
    }
}

