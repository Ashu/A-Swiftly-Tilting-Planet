//
//  TodayHeader.swift
//  Widget
//
//  Created by Caleb Wells on 5/24/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class TodayHeader: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    func addSubviews() {
        let todayButtons = UIStackView()
        todayButtons.distribution = .fillEqually
        todayButtons.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todayButtons)
        
        for title in ["🤯", "🥰", "😜"]{
            let todayButton = UIButton()
            todayButton.setTitle(title, for: .normal)
            todayButton.titleLabel?.font = .boldSystemFont(ofSize: 72)
            todayButton.addTarget(self, action: #selector(handleTodayButtonTap(_:)), for: .touchUpInside)
            todayButtons.addArrangedSubview(todayButton)
        }
        
        NSLayoutConstraint.activate([
            todayButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todayButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            todayButtons.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            todayButtons.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    @objc func handleTodayButtonTap(_ sender: UIButton) {
        print("\n=== \(String(describing: sender.titleLabel)) ===\n")
    }
}
