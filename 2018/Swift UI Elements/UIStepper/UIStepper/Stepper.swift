//
//  Stepper.swift
//  UIStepper
//
//  Created by Caleb Wells on 5/3/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class Stepper: UIStepper {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    func createSubviews() {
        let stepper = UIStepper(frame: CGRect(x: 110, y: 250, width: 0, height: 0))
        stepper.maximumValue = 10
    }
    
    
}
