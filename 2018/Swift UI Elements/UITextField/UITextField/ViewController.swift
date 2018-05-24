//
//  ViewController.swift
//  UITextField
//
//  Created by Caleb Wells on 5/24/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let headerView: UIView = {
        let header = UIView()
        header.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.3215686275, blue: 0.2470588235, alpha: 1)
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "UITextField"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpLayouts()
    }
    
    func setUpLayouts() {
        view.addSubview(headerView)
        view.addSubview(headerLabel)
        
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),
            
            headerLabel.centerXAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerYAnchor)
            ])
    }
}

