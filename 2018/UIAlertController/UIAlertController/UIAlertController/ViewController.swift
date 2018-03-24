//
//  ViewController.swift
//  UIAlertController
//
//  Created by Caleb Wells on 3/23/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleAlert()
    }
    
    func handleAlert() {
        let alert = UIAlertController(title: "Hello", message: "This is an alert", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Red", style: .default, handler: {_ in
            self.view.backgroundColor = .red
        }))
        
        alert.addAction(UIAlertAction(title: "Green", style: .default, handler: {_ in
            self.view.backgroundColor = .green
        }))
        
        alert.addAction(UIAlertAction(title: "White", style: .default, handler: {_ in
            self.view.backgroundColor = .white
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            print("cancel")
        }))
        
        present(alert, animated: true)
    }
}

