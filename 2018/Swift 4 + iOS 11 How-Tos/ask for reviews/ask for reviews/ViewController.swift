//
//  ViewController.swift
//  ask for reviews
//
//  Created by Caleb Wells on 1/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
    
    var score = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        score += 1
        
        print(score)
        if score > 10 {
            review()
        }
    }
    
    func review() {
        SKStoreReviewController.requestReview()
    }

}

