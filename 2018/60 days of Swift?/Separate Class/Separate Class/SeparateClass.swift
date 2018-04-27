//
//  SeparateClass.swift
//  Separate Class
//
//  Created by Caleb Wells on 4/26/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

let label: UILabel = {
    let label = UILabel()
    label.text = "Hello, world?"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 27)
    return label
}()

let textField: UITextField = {
    let text = UITextField()
    text.placeholder = "Enter text here"
    text.borderStyle = UITextBorderStyle.roundedRect
    return text
}()

