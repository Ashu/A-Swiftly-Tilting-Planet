//
//  ViewController.swift
//  UIStepper
//
//  Created by Caleb Wells on 5/3/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let header = Header()
    
    override func loadView() {
        view = header
        header.stepper.addTarget(self, action: #selector(handleStepper(_:)), for: .valueChanged)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
    
    @objc func handleStepper(_ sender: UIStepper) {
        header.label.text = "Hello, stepper \(sender.value)"
    }

}
