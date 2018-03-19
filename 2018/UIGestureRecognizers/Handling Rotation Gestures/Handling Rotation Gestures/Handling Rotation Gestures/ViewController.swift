//
//  ViewController.swift
//  Handling Rotation Gestures
//
//  Created by Caleb Wells on 3/17/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(sender:)))
        view.addGestureRecognizer(rotate)

    }
    
    @objc func handleRotation(sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else { return }
        
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
}

