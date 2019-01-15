//
//  ButtonOne.swift
//  Swift Programmatically
//
//  Created by Caleb Wells on 1/14/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ButtonOne: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setTitle("Button", for: .normal)
        backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
