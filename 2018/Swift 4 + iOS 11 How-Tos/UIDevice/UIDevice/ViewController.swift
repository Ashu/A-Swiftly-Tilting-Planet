//
//  ViewController.swift
//  UIDevice
//
//  Created by Caleb Wells on 2/28/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            view.backgroundColor = .red
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            view.backgroundColor = .blue
        }
    }
}

