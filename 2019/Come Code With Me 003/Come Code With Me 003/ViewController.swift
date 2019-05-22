//
//  ViewController.swift
//  Come Code With Me 003
//
//  Created by Caleb Wells on 5/21/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cardView = UIView()
    let cardLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        navigationItem.title = "Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        makeCardView()
    }
    
    func makeCardView() {
        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowOpacity = 0.72
        cardView.layer.shadowColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        cardView.layer.shadowRadius = 12
        cardView.layer.shadowOffset = CGSize(width: -24, height: 24)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        cardLabel.text = "Hello, Card View!\nThis is just some text."
        cardLabel.numberOfLines = 0
        cardLabel.alpha = 0
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(cardLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100),
            cardView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 172),
            
            cardLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            cardLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12)
        ])
    }
    
    @objc func handleTap() {
        UIView.animate(withDuration: 1.0) {
            if self.cardView.layer.shadowRadius == 12 {
                self.cardView.layer.shadowRadius = 3
                self.cardView.layer.shadowOffset = CGSize(width: -6, height: 6)
                self.cardLabel.alpha = 1
            } else {
                self.cardView.layer.shadowRadius = 12
                self.cardView.layer.shadowOffset = CGSize(width: -24, height: 24)
                self.cardLabel.alpha = 0
            }
        }
    }
}
