//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Caleb Wells on 2/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(self, action: #selector(handleValueChange), for: .valueChanged)
        return picker
    }()
    
    @objc func handleValueChange(_ sender: UIDatePicker) {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        print(selectedDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(datePicker)
        
        datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        datePicker.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
}
