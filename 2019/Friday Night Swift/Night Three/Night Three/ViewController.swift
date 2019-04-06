//
//  ViewController.swift
//  Night Three
//
//  Created by Caleb Wells on 4/5/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        setupSubViews()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    func setupNavigationItems() {
        navigationItem.title = "Some App"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupSubViews() {
        let image = UIImageView(image: #imageLiteral(resourceName: "people"))
        image.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Fortnite"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        
        let label = UILabel()
        label.text = "Battle Royale"
        
        let rating = UILabel()
        rating.text = "⭑⭑⭑⭑⭑ 3.76M"
        
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, label, rating])
        labelsStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [image, labelsStackView, button])
        stackView.alignment = .center
        stackView.setCustomSpacing(20, after: image)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
