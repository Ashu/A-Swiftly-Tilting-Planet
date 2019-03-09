//
//  ViewController.swift
//  Night One
//
//  Created by Caleb Wells on 3/8/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewOne = UIView()
    let viewTwo = UIView()
    
    let svOne = UIView()
    let svTwo = UIView()
    let svThree = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        createSubviews()
    }
    
    func createSubviews() {
        viewOne.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        viewTwo.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        svOne.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        svTwo.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        svThree.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        let newStackView = UIStackView(arrangedSubviews: [svOne, svTwo, svThree])
        newStackView.distribution = .fillEqually
        newStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [newStackView, viewTwo, viewOne ])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
}
