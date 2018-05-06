//
//  ViewController.swift
//  Search Images Pixabay
//
//  Created by Caleb Wells on 5/5/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let photoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .lightGray
        return image
    }()
    
    let photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo name"
        return label
    }()
    
    let getPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get New Photo", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(getNewPhoto), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        setUpLayout()
    }
    
    @objc func getNewPhoto() {
        setUIEnabled(false)
        photoLabel.text = "Photo coming soon"
    }
    
    func setUIEnabled(_ enabled: Bool) {
        if enabled {
            getPhotoButton.alpha = 1.0
        } else {
            getPhotoButton.alpha = 0.5
        }
    }
    
    func setUpLayout() {
        let stackView = UIStackView(arrangedSubviews: [photoImage, photoLabel, getPhotoButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.setCustomSpacing(24, after: photoLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
}

