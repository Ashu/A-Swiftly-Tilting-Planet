//
//  Header.swift
//  UIStepper
//
//  Created by Caleb Wells on 5/3/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class Header: UIView {
    
    let stepper = Stepper()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    func createSubviews() {
        
        let headerBackground = UIView()
        headerBackground.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.5137254902, blue: 0.2352941176, alpha: 1)
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(headerBackground)
        
        let header = UILabel()
        header.text = "UIStepper"
        header.font = UIFont.boldSystemFont(ofSize: 27)
        header.textAlignment = .center
        header.textColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        
        headerBackground.addSubview(header)
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stepper)
        
        let label = UILabel()
        label.text = "Hello, stepper"
        
        let stackView = UIStackView(arrangedSubviews: [label, stepper])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: self.topAnchor),
            headerBackground.widthAnchor.constraint(equalTo: self.widthAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 120),
            
            header.centerXAnchor.constraint(equalTo: headerBackground.safeAreaLayoutGuide.centerXAnchor),
            header.centerYAnchor.constraint(equalTo: headerBackground.safeAreaLayoutGuide.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40)
        ])
        
    }
}
