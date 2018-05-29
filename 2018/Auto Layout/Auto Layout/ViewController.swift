//
//  ViewController.swift
//  Auto Layout
//
//  Created by Caleb Wells on 5/29/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let viewOne = UIView()
        viewOne.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        viewOne.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewOne)
        
        let viewTwo = UIView()
        viewTwo.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        viewTwo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTwo)
        
        NSLayoutConstraint.activate([
            viewOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewOne.widthAnchor.constraint(equalTo: view.widthAnchor),
            viewOne.heightAnchor.constraint(equalToConstant: 200),
            
            viewTwo.topAnchor.constraint(equalTo: viewOne.bottomAnchor),
            viewTwo.widthAnchor.constraint(equalTo: view.widthAnchor),
            viewTwo.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}

