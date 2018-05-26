//
//  ViewController.swift
//  Core Spotlight
//
//  Created by Caleb Wells on 5/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeData as String)
        attributeSet.title = "Hell0"
        
    }
}

